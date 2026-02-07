//
//  CartViewModel.swift
//  PickORDrop
//

import Foundation

@Observable
final class CartViewModel {
    private let cartService: CartService

    init(cartService: CartService) {
        self.cartService = cartService
    }

    var items: [CartItem] {
        cartService.items
    }

    var total: Decimal {
        cartService.cartTotal
    }

    var isEmpty: Bool {
        cartService.items.isEmpty
    }

    func updateQuantity(for productId: UUID, quantity: Int) {
        cartService.updateQuantity(for: productId, quantity: quantity)
    }

    func remove(item: CartItem) {
        cartService.remove(productId: item.product.id)
    }
}
