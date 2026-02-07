//
//  MainTabView.swift
//  PickORDrop
//

import SwiftUI

struct MainTabView: View {
    @Environment(CartService.self) private var cartService
    @Environment(LocationService.self) private var locationService

    var body: some View {
        NavigationStack {
            TabView {
                HomeView(viewModel: HomeViewModel(cartService: cartService))
                    .tabItem {
                        Label("Menu", systemImage: "menucard.fill")
                    }
                CartView(viewModel: CartViewModel(cartService: cartService))
                    .tabItem {
                        Label("Cart", systemImage: "cart.fill")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 4) {
                        Image(systemName: "location.fill")
                            .font(.subheadline)
                            .foregroundStyle(AppTheme.accent)
                        if locationService.isUpdating {
                            Text("Detecting…")
                                .font(.caption)
                                .foregroundStyle(AppTheme.secondaryText)
                        } else {
                            Text(locationService.locationDescription ?? "Set location")
                                .font(.caption)
                                .foregroundStyle(AppTheme.primaryText)
                                .lineLimit(1)
                        }
                    }
                    .onAppear { locationService.requestLocation() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    MainTabView()
        .environment(CartService())
        .environment(LocationService())
}
