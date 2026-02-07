//
//  ShopListScreen.swift
//  PickORDrop
//

import SwiftUI

struct ShopListScreen: View {
    @Bindable var viewModel: HomeViewModel
    let category: StoreCategory

    var body: some View {
        Group {
            if viewModel.isLoadingShops {
                ProgressView("Loading…")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = viewModel.errorMessage {
                ContentUnavailableView("Something went wrong", systemImage: "exclamationmark.triangle", description: Text(error))
            } else if viewModel.shops.isEmpty {
                ContentUnavailableView("No shops", systemImage: "storefront", description: Text("No \(category.rawValue.lowercased())s available right now."))
            } else {
                List(viewModel.shops) { shop in
                    NavigationLink(value: shop) {
                        ShopRow(shop: shop)
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle(category.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            viewModel.selectCategory(category)
            await viewModel.loadShops()
        }
    }
}

struct ShopRow: View {
    let shop: Shop

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: shop.imageName ?? "storefront")
                .font(.title2)
                .foregroundStyle(AppTheme.accent)
                .frame(width: 44, height: 44)
                .background(AppTheme.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 2) {
                Text(shop.name)
                    .font(.headline)
                    .foregroundStyle(AppTheme.primaryText)
                Text(shop.tagline)
                    .font(.caption)
                    .foregroundStyle(AppTheme.secondaryText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 4)
    }
}
