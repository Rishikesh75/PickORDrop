//
//  OrderTypeRow.swift
//  PickORDrop
//

import SwiftUI

struct OrderTypeRow: View {
    let orderType: OrderType
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: orderType.systemImageName)
                    .font(.title2)
                    .foregroundStyle(isSelected ? .white : AppTheme.accent)
                    .frame(width: 44, height: 44)
                    .background(isSelected ? AppTheme.accent : AppTheme.cardBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading, spacing: 2) {
                    Text(orderType.rawValue)
                        .font(.headline)
                        .foregroundStyle(AppTheme.primaryText)
                    Text(orderType.subtitle)
                        .font(.caption)
                        .foregroundStyle(AppTheme.secondaryText)
                }
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(AppTheme.accent)
                }
            }
            .padding()
            .background(AppTheme.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadius)
                    .stroke(isSelected ? AppTheme.accent : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack {
        OrderTypeRow(orderType: .pickUp, isSelected: true, action: {})
        OrderTypeRow(orderType: .delivery, isSelected: false, action: {})
    }
    .padding()
}
