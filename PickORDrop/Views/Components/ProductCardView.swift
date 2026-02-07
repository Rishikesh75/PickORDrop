//
//  ProductCardView.swift
//  PickORDrop
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    let onAddToCart: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: AppTheme.cornerRadius)
                    .fill(AppTheme.cardBackground)
                    .frame(height: 100)
                Image(systemName: product.imageName ?? "photo")
                    .font(.system(size: 40))
                    .foregroundStyle(AppTheme.secondaryText)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)
                    .foregroundStyle(AppTheme.primaryText)
                Text(product.description)
                    .font(.caption)
                    .foregroundStyle(AppTheme.secondaryText)
                    .lineLimit(2)
                Text(product.price.formattedPrice)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(AppTheme.accent)
            }

            Button(action: onAddToCart) {
                Label("Add to cart", systemImage: "cart.badge.plus")
                    .font(.subheadline.weight(.medium))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
            }
            .buttonStyle(.borderedProminent)
            .tint(AppTheme.accent)
        }
        .padding(AppTheme.cardPadding)
        .background(AppTheme.primaryBackground)
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: AppTheme.cornerRadius)
                .stroke(AppTheme.secondaryBackground, lineWidth: 1)
        )
    }
}

#Preview {
    ProductCardView(
        product: Product.sampleProducts[0],
        onAddToCart: {}
    )
    .padding()
}
