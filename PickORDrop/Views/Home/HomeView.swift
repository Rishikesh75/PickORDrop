//
//  HomeView.swift
//  PickORDrop
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel
    @Environment(CartService.self) private var cartService

    init(viewModel: HomeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            OrderTypeSelectionView()
                .navigationDestination(for: StoreCategory.self) { category in
                    ShopListScreen(viewModel: viewModel, category: category)
                        .onDisappear { viewModel.clearCategorySelection() }
                }
                .navigationDestination(for: Shop.self) { shop in
                    ProductListScreen(viewModel: viewModel, shop: shop)
                        .onDisappear { viewModel.clearShopSelection() }
                }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(cartService: CartService()))
        .environment(CartService())
        .environment(LocationService())
}
