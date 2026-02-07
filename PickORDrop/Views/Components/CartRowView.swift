//
//  CartRowView.swift
//  PickORDrop
//

import SwiftUI

struct CartRowView: View {
    let item: CartItem
    let onQuantityChange: (Int) -> Void
    let onRemove: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: item.product.imageName ?? "photo")
                .font(.title2)
                .foregroundStyle(AppTheme.secondaryText)
                .frame(width: 44, height: 44)
                .background(AppTheme.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {
                Text(item.product.name)
                    .font(.headline)
                Text(item.subtotal.formattedPrice)
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.accent)
            }

            Spacer()

            HStack(spacing: 8) {
                Button(action: { onQuantityChange(max(1, item.quantity - 1)) }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundStyle(AppTheme.accent)
                }
                Text("\(item.quantity)")
                    .font(.subheadline.weight(.medium))
                    .frame(minWidth: 24)
                Button(action: { onQuantityChange(item.quantity + 1) }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(AppTheme.accent)
                }
            }

            Button(action: onRemove) {
                Image(systemName: "trash")
                    .foregroundStyle(.red)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    CartRowView(
        item: CartItem(product: Product.sampleProducts[0], quantity: 2),
        onQuantityChange: { _ in },
        onRemove: {}
    )
    .padding()
}
