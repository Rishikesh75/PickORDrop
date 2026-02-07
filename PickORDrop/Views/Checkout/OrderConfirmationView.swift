//
//  OrderConfirmationView.swift
//  PickORDrop
//

import SwiftUI

struct OrderConfirmationView: View {
    let order: Order
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 70))
                .foregroundStyle(AppTheme.success)
            Text("Order placed!")
                .font(.title.weight(.bold))
            Text("Order #\(order.id.uuidString.prefix(8))")
                .font(.subheadline)
                .foregroundStyle(AppTheme.secondaryText)

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: order.orderType.systemImageName)
                    Text(order.orderType.rawValue)
                    Spacer()
                }
                .font(.headline)
                if let address = order.deliveryAddress, !address.isEmpty {
                    Text(address)
                        .font(.subheadline)
                        .foregroundStyle(AppTheme.secondaryText)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppTheme.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius))
            .padding(.horizontal)

            Text(order.total.formattedPrice)
                .font(.title2.weight(.semibold))
                .foregroundStyle(AppTheme.accent)

            Spacer()
            Button("Done", action: onDismiss)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .padding(.bottom, 32)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
