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
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading menu…")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.errorMessage {
                    ContentUnavailableView("Something went wrong", systemImage: "exclamationmark.triangle", description: Text(error))
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
            .navigationTitle("PickORDrop")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView(viewModel: CartViewModel(cartService: cartService))) {
                        Image(systemName: "cart.fill")
                        if viewModel.cartCount > 0 {
                            Text("\(viewModel.cartCount)")
                                .font(.caption2)
                                .padding(4)
                                .background(AppTheme.accent)
                                .clipShape(Circle())
                                .offset(x: 8, y: -8)
                        }
                    }
                }
            }
            .task {
                await viewModel.loadProducts()
            }
        }
    }
}
