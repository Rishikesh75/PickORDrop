//
//  StoreCategory.swift
//  PickORDrop
//

import Foundation

/// Type of store: where the user is ordering from (restaurant, supermarket, meat shop, or chat shop).
enum StoreCategory: String, CaseIterable, Identifiable, Hashable {
    case restaurant = "Restaurant"
    case grocery = "Grocery"
    case meat = "Meat Shop"
    case chatShops = "Chat Shops"

    var id: String { rawValue }

    var subtitle: String {
        switch self {
        case .restaurant: return "Order from restaurants"
        case .grocery: return "Order from supermarkets"
        case .meat: return "Order from meat shops"
        case .chatShops: return "Order from chat shops"
        }
    }

    var systemImageName: String {
        switch self {
        case .restaurant: return "fork.knife"
        case .grocery: return "cart.fill"
        case .meat: return "fish.fill"
        case .chatShops: return "bubble.left.and.bubble.right.fill"
        }
    }
}
