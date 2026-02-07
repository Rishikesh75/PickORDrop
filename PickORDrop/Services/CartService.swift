//
//  CartService.swift
//  PickORDrop
//

import Foundation

/// Single source of truth for cart and order type. Injected into ViewModels.
@Observable
final class CartService {
    private(set) var items: [CartItem] = []
    private(set) var selectedOrderType: OrderType = .pickUp
    private(set) var deliveryAddress: String = ""

    var cartCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    var cartTotal: Decimal {
        items.reduce(0) { $0 + $1.subtotal }
    }

    func add(product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += quantity
        } else {
            items.append(CartItem(product: product, quantity: quantity))
        }
    }

    func updateQuantity(for productId: UUID, quantity: Int) {
        guard quantity > 0 else {
            remove(productId: productId)
            return
        }
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            items[index].quantity = quantity
        }
    }

    func remove(productId: UUID) {
        items.removeAll { $0.product.id == productId }
    }

    func clearCart() {
        items = []
    }

    func setOrderType(_ type: OrderType) {
        selectedOrderType = type
    }

    func setDeliveryAddress(_ address: String) {
        deliveryAddress = address
    }

    func placeOrder() -> Order {
        let order = Order(
            items: items,
            orderType: selectedOrderType,
            deliveryAddress: selectedOrderType == .delivery ? deliveryAddress : nil
        )
        clearCart()
        return order
    }
}
