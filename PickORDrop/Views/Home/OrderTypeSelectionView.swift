//
//  OrderTypeSelectionView.swift
//  PickORDrop
//

import SwiftUI

struct OrderTypeSelectionView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(StoreCategory.allCases) { category in
                    NavigationLink(value: category) {
                        CategoryCard(category: category)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .background(AppTheme.secondaryBackground)
    }
}

struct CategoryCard: View {
    let category: StoreCategory

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: category.systemImageName)
                .font(.system(size: 36))
                .foregroundStyle(AppTheme.accent)
                .frame(width: 56, height: 56)
                .background(AppTheme.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius))

            VStack(alignment: .leading, spacing: 4) {
                Text(category.rawValue)
                    .font(.headline)
                    .foregroundStyle(AppTheme.primaryText)
                Text(category.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.secondaryText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "chevron.right")
                .font(.body.weight(.semibold))
                .foregroundStyle(AppTheme.secondaryText)
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
