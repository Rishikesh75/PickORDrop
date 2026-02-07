//
//  OrderType.swift
//  PickORDrop
//

import Foundation

/// How the customer wants to receive their order: pick up at store or delivery to address.
enum OrderType: String, CaseIterable, Identifiable, Hashable {
    case pickUp = "Pick Up"
    case delivery = "Delivery"

    var id: String { rawValue }

    var subtitle: String {
        switch self {
        case .pickUp: return "Collect your order at the store"
        case .delivery: return "We deliver to your address"
        }
    }

    var systemImageName: String {
        switch self {
        case .pickUp: return "bag.fill"
        case .delivery: return "car.fill"
        }
    }
}
