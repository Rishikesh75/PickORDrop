//
//  CartItem.swift
//  PickORDrop
//

import Foundation

struct CartItem: Identifiable, Hashable {
    let id: UUID
    let product: Product
    var quantity: Int

    var subtotal: Decimal {
        product.price * Decimal(quantity)
    }

    init(id: UUID = UUID(), product: Product, quantity: Int = 1) {
        self.id = id
        self.product = product
        self.quantity = quantity
    }
}
