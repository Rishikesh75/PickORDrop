//
//  ProductListScreen.swift
//  PickORDrop
//

import SwiftUI

struct ProductListScreen: View {
    @Bindable var viewModel: HomeViewModel
    let shop: Shop

    var body: some View {
        Group {
            if viewModel.isLoadingProducts {
                ProgressView("Loading menu…")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = viewModel.errorMessage {
                ContentUnavailableView("Something went wrong", systemImage: "exclamationmark.triangle", description: Text(error))
            } else if viewModel.products.isEmpty {
                ContentUnavailableView("No items", systemImage: "tray", description: Text("This shop has no items listed yet."))
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(viewModel.products) { product in
                            ProductCardView(product: product) {
                                viewModel.addToCart(product)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle(shop.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            viewModel.selectShop(shop)
            await viewModel.loadProducts()
        }
    }
}
