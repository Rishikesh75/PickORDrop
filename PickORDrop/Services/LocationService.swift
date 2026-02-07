//
//  LocationService.swift
//  PickORDrop
//

import CoreLocation
import Foundation
import MapKit

@Observable
@MainActor
final class LocationService: NSObject {
    var locationDescription: String?
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    var isUpdating = false

    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        authorizationStatus = manager.authorizationStatus
    }

    func requestLocation() {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            isUpdating = true
            manager.requestLocation()
        case .denied, .restricted:
            locationDescription = "Location unavailable"
        @unknown default:
            break
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    nonisolated func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        Task { @MainActor in
            authorizationStatus = status
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                manager.requestLocation()
            } else if status == .denied || status == .restricted {
                locationDescription = "Location unavailable"
            }
        }
    }

    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        Task { @MainActor in
            await reverseGeocodeWithMapKit(location)
            isUpdating = false
        }
    }

    nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Task { @MainActor in
            locationDescription = "Location unavailable"
            isUpdating = false
        }
    }

    @MainActor
    private func reverseGeocodeWithMapKit(_ location: CLLocation) async {
        guard let request = MKReverseGeocodingRequest(location: location) else {
            locationDescription = "Current location"
            return
        }
        do {
            let mapItems: [MKMapItem] = try await withCheckedThrowingContinuation { continuation in
                request.getMapItems { mapItems, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else {
                        continuation.resume(returning: mapItems ?? [])
                    }
                }
            }
            if let first = mapItems.first {
                let place = first.placemark
                let parts = [place.locality, place.administrativeArea].compactMap { $0 }
                locationDescription = parts.isEmpty ? (place.name ?? "Current location") : parts.joined(separator: ", ")
            } else {
                locationDescription = "Current location"
            }
        } catch {
            locationDescription = "Current location"
        }
    }
}
