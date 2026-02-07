//
//  CheckoutViewModel.swift
//  PickORDrop
//

import Foundation

@Observable
final class CheckoutViewModel {
    private let cartService: CartService

    var selectedOrderType: OrderType {
        get { cartService.selectedOrderType }
        set { cartService.setOrderType(newValue) }
    }

    var deliveryAddress: String {
        get { cartService.deliveryAddress }
        set { cartService.setDeliveryAddress(newValue) }
    }

    var placedOrder: Order?
    var didCompleteOrder = false

    init(cartService: CartService) {
        self.cartService = cartService
    }

    var items: [CartItem] {
        cartService.items
    }

    var total: Decimal {
        cartService.cartTotal
    }

    var canPlaceOrder: Bool {
        if selectedOrderType == .delivery {
            return !deliveryAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
        return true
    }

    func placeOrder() {
        guard canPlaceOrder else { return }
        placedOrder = cartService.placeOrder()
        didCompleteOrder = true
    }
}
