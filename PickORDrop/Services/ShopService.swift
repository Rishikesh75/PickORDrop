//
//  ShopService.swift
//  PickORDrop
//

import Foundation

protocol ShopServiceProtocol {
    func fetchShops(category: StoreCategory) async -> [Shop]
}

final class ShopService: ShopServiceProtocol {
    func fetchShops(category: StoreCategory) async -> [Shop] {
        try? await Task.sleep(nanoseconds: 300_000_000)
        return Shop.sampleShops.filter { $0.category == category }
    }
}

// MARK: - Sample Shops (stable IDs for product association)
extension Shop {
    static let sampleShops: [Shop] = [
        // Restaurants
        Shop(
            id: ShopIds.burgerJoint,
            name: "The Burger Joint",
            tagline: "Burgers & fries",
            imageName: "fork.knife",
            category: .restaurant
        ),
        Shop(
            id: ShopIds.pizzaPlace,
            name: "Pizza Place",
            tagline: "Wood-fired pizzas",
            imageName: "flame.fill",
            category: .restaurant
        ),
        // Grocery / Supermarkets
        Shop(
            id: ShopIds.freshMart,
            name: "Fresh Mart",
            tagline: "Supermarket & daily essentials",
            imageName: "cart.fill",
            category: .grocery
        ),
        Shop(
            id: ShopIds.greenGrocer,
            name: "Green Grocer",
            tagline: "Fresh produce & groceries",
            imageName: "leaf.fill",
            category: .grocery
        ),
        // Meat shops
        Shop(
            id: ShopIds.butcherBlock,
            name: "The Butcher Block",
            tagline: "Premium meats",
            imageName: "fish.fill",
            category: .meat
        ),
        Shop(
            id: ShopIds.meatMarket,
            name: "Meat Market",
            tagline: "Fresh cuts & poultry",
            imageName: "fish.fill",
            category: .meat
        ),
        // Chat Shops
        Shop(
            id: ShopIds.chatCorner,
            name: "Chat Corner",
            tagline: "Snacks & beverages",
            imageName: "bubble.left.and.bubble.right.fill",
            category: .chatShops
        ),
        Shop(
            id: ShopIds.quickBite,
            name: "Quick Bite Chat",
            tagline: "Quick bites & drinks",
            imageName: "bubble.left.and.bubble.right.fill",
            category: .chatShops
        ),
    ]
}

enum ShopIds {
    static let burgerJoint = UUID(uuidString: "E621E1F8-C36C-4A00-0001-000000000001")!
    static let pizzaPlace = UUID(uuidString: "E621E1F8-C36C-4A00-0002-000000000002")!
    static let freshMart = UUID(uuidString: "E621E1F8-C36C-4A00-0003-000000000003")!
    static let greenGrocer = UUID(uuidString: "E621E1F8-C36C-4A00-0004-000000000004")!
    static let butcherBlock = UUID(uuidString: "E621E1F8-C36C-4A00-0005-000000000005")!
    static let meatMarket = UUID(uuidString: "E621E1F8-C36C-4A00-0006-000000000006")!
    static let chatCorner = UUID(uuidString: "E621E1F8-C36C-4A00-0007-000000000007")!
    static let quickBite = UUID(uuidString: "E621E1F8-C36C-4A00-0008-000000000008")!
}
