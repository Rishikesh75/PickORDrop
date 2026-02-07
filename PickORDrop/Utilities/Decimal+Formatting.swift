//
//  Decimal+Formatting.swift
//  PickORDrop
//

import Foundation

extension Decimal {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter.string(from: self as NSDecimalNumber) ?? "$0.00"
    }
}
