//
//  CheckoutView.swift
//  PickORDrop
//

import SwiftUI

struct CheckoutView: View {
    @State private var viewModel: CheckoutViewModel
    @State private var confirmedOrder: Order?
    @Environment(\.dismiss) private var dismiss

    init(viewModel: CheckoutViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                orderTypeSection
                if viewModel.selectedOrderType == .delivery {
                    deliveryAddressSection
                }
                orderSummarySection
                placeOrderButton
            }
            .padding()
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(item: $confirmedOrder) { order in
            OrderConfirmationView(order: order) {
                confirmedOrder = nil
                dismiss()
            }
        }
    }

    private var orderTypeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("How would you like to receive your order?")
                .font(.headline)
            ForEach(OrderType.allCases) { type in
                OrderTypeRow(
                    orderType: type,
                    isSelected: viewModel.selectedOrderType == type
                ) {
                    viewModel.selectedOrderType = type
                }
            }
        }
    }

    private var deliveryAddressSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Delivery address")
                .font(.headline)
            TextField("Street, city, postal code", text: Binding(
                get: { viewModel.deliveryAddress },
                set: { newValue in viewModel.deliveryAddress = newValue }
            ), axis: .vertical)
            .textFieldStyle(.roundedBorder)
            .lineLimit(3...6)
        }
    }

    private var orderSummarySection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Order summary")
                .font(.headline)
            ForEach(viewModel.items) { item in
                HStack {
                    Text(item.product.name)
                    Spacer()
                    Text("\(item.quantity)× \(item.product.price.formattedPrice)")
                        .foregroundStyle(AppTheme.secondaryText)
                }
                .font(.subheadline)
            }
            Divider()
            HStack {
                Text("Total")
                    .font(.headline)
                Spacer()
                Text(viewModel.total.formattedPrice)
                    .font(.headline)
                    .foregroundStyle(AppTheme.accent)
            }
        }
        .padding()
        .background(AppTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius))
    }

    private var placeOrderButton: some View {
        Button(action: {
            viewModel.placeOrder()
            if let order = viewModel.placedOrder {
                confirmedOrder = order
            }
        }) {
            Text("Place order")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .buttonStyle(.borderedProminent)
        .tint(AppTheme.accent)
        .disabled(!viewModel.canPlaceOrder)
    }
}
