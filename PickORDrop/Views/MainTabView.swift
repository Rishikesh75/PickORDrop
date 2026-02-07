//
//  MainTabView.swift
//  PickORDrop
//

import SwiftUI

struct MainTabView: View {
    @Environment(CartService.self) private var cartService

    var body: some View {
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
    }
}
