//
//  Order.swift
//  PickORDrop
//

import Foundation

struct Order: Identifiable, Hashable {
    let id: UUID
    let items: [CartItem]
    let orderType: OrderType
    let deliveryAddress: String?
    let createdAt: Date
    var status: OrderStatus

    var total: Decimal {
        items.reduce(0) { $0 + $1.subtotal }
    }

    init(
        id: UUID = UUID(),
        items: [CartItem],
        orderType: OrderType,
        deliveryAddress: String? = nil,
        createdAt: Date = Date(),
        status: OrderStatus = .placed
    ) {
        self.id = id
        self.items = items
        self.orderType = orderType
        self.deliveryAddress = deliveryAddress
        self.createdAt = createdAt
        self.status = status
    }
}

enum OrderStatus: String, CaseIterable, Hashable {
    case placed
    case preparing
    case readyForPickup
    case outForDelivery
    case delivered
    case completed
}
