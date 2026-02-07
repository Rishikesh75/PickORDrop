//
//  CartView.swift
//  PickORDrop
//

import SwiftUI

struct CartView: View {
    @State private var viewModel: CartViewModel
    @Environment(CartService.self) private var cartService

    init(viewModel: CartViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isEmpty {
                    ContentUnavailableView(
                        "Your cart is empty",
                        systemImage: "cart",
                        description: Text("Add items from the menu to get started.")
                    )
                } else {
                    List {
                        ForEach(viewModel.items) { item in
                            CartRowView(
                                item: item,
                                onQuantityChange: { viewModel.updateQuantity(for: item.product.id, quantity: $0) },
                                onRemove: { viewModel.remove(item: item) }
                            )
                        }
                    }
                    .listStyle(.plain)

                    VStack(spacing: 0) {
                        Divider()
                        HStack {
                            Text("Total")
                                .font(.headline)
                            Spacer()
                            Text(viewModel.total.formattedPrice)
                                .font(.headline)
                                .foregroundStyle(AppTheme.accent)
                        }
                        .padding()

                        NavigationLink(destination: checkoutDestination) {
                            Text("Proceed to checkout")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(AppTheme.accent)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    .background(AppTheme.primaryBackground)
                }
            }
            .navigationTitle("Cart")
        }
    }

    @ViewBuilder
    private var checkoutDestination: some View {
        CheckoutView(viewModel: CheckoutViewModel(cartService: cartService))
    }
}
