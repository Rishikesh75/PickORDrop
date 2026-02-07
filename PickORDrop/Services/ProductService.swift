//
//  ProductService.swift
//  PickORDrop
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts(shopId: UUID) async -> [Product]
}

final class ProductService: ProductServiceProtocol {
    func fetchProducts(shopId: UUID) async -> [Product] {
        try? await Task.sleep(nanoseconds: 300_000_000)
        return Product.sampleProductsByShop[shopId] ?? []
    }
}

// MARK: - Sample Products by Shop
extension Product {
    static let sampleProductsByShop: [UUID: [Product]] = [
        ShopIds.burgerJoint: [
            Product(name: "Fresh Burger", description: "Juicy beef patty with lettuce and special sauce", price: 8.99, imageName: "fork.knife", category: "Food", shopId: ShopIds.burgerJoint),
            Product(name: "Crispy Fries", description: "Golden crispy fries with seasoning", price: 3.49, imageName: "frying.pan", category: "Sides", shopId: ShopIds.burgerJoint),
            Product(name: "Cold Brew", description: "Smooth cold brew coffee", price: 4.99, imageName: "cup.and.saucer.fill", category: "Drinks", shopId: ShopIds.burgerJoint),
            Product(name: "Chocolate Shake", description: "Rich chocolate milkshake", price: 5.49, imageName: "birthday.cake.fill", category: "Drinks", shopId: ShopIds.burgerJoint),
            Product(name: "Garden Salad", description: "Fresh greens with vinaigrette", price: 6.99, imageName: "leaf.fill", category: "Sides", shopId: ShopIds.burgerJoint),
        ],
        ShopIds.pizzaPlace: [
            Product(name: "Margherita", description: "Tomato, mozzarella, basil", price: 10.99, imageName: "flame.fill", category: "Pizza", shopId: ShopIds.pizzaPlace),
            Product(name: "Pepperoni", description: "Classic pepperoni pizza", price: 12.49, imageName: "flame.fill", category: "Pizza", shopId: ShopIds.pizzaPlace),
            Product(name: "Garlic Bread", description: "Toasted with garlic butter", price: 4.99, imageName: "fork.knife", category: "Sides", shopId: ShopIds.pizzaPlace),
        ],
        ShopIds.freshMart: [
            Product(name: "Organic Milk 1L", description: "Fresh organic whole milk", price: 3.99, imageName: "cup.and.saucer.fill", category: "Dairy", shopId: ShopIds.freshMart),
            Product(name: "Whole Wheat Bread", description: "Fresh baked bread", price: 2.49, imageName: "birthday.cake.fill", category: "Bakery", shopId: ShopIds.freshMart),
            Product(name: "Eggs (12)", description: "Free-range eggs", price: 4.29, imageName: "leaf.fill", category: "Dairy", shopId: ShopIds.freshMart),
        ],
        ShopIds.greenGrocer: [
            Product(name: "Organic Apples 1kg", description: "Crisp and sweet", price: 4.99, imageName: "leaf.fill", category: "Produce", shopId: ShopIds.greenGrocer),
            Product(name: "Bananas (bunch)", description: "Ripe bananas", price: 1.99, imageName: "leaf.fill", category: "Produce", shopId: ShopIds.greenGrocer),
            Product(name: "Spinach 200g", description: "Fresh baby spinach", price: 2.99, imageName: "leaf.fill", category: "Produce", shopId: ShopIds.greenGrocer),
        ],
        ShopIds.butcherBlock: [
            Product(name: "Ribeye Steak 400g", description: "Premium grass-fed ribeye", price: 18.99, imageName: "fish.fill", category: "Beef", shopId: ShopIds.butcherBlock),
            Product(name: "Chicken Breast 500g", description: "Skinless chicken breast", price: 8.49, imageName: "fish.fill", category: "Poultry", shopId: ShopIds.butcherBlock),
            Product(name: "Ground Beef 500g", description: "Lean ground beef", price: 7.99, imageName: "fish.fill", category: "Beef", shopId: ShopIds.butcherBlock),
        ],
        ShopIds.meatMarket: [
            Product(name: "Pork Chops 2pc", description: "Bone-in pork chops", price: 11.99, imageName: "fish.fill", category: "Pork", shopId: ShopIds.meatMarket),
            Product(name: "Lamb Chops 300g", description: "New Zealand lamb", price: 16.99, imageName: "fish.fill", category: "Lamb", shopId: ShopIds.meatMarket),
            Product(name: "Sausages 6pc", description: "Traditional pork sausages", price: 6.99, imageName: "fish.fill", category: "Pork", shopId: ShopIds.meatMarket),
        ],
        ShopIds.chatCorner: [
            Product(name: "Masala Chai", description: "Spiced Indian tea", price: 2.99, imageName: "cup.and.saucer.fill", category: "Beverages", shopId: ShopIds.chatCorner),
            Product(name: "Samosa (2pc)", description: "Crispy potato samosas", price: 4.49, imageName: "fork.knife", category: "Snacks", shopId: ShopIds.chatCorner),
            Product(name: "Filter Coffee", description: "South Indian filter coffee", price: 3.49, imageName: "cup.and.saucer.fill", category: "Beverages", shopId: ShopIds.chatCorner),
        ],
        ShopIds.quickBite: [
            Product(name: "Vada Pav", description: "Spicy potato fritter in bun", price: 3.99, imageName: "fork.knife", category: "Snacks", shopId: ShopIds.quickBite),
            Product(name: "Lassi", description: "Sweet yogurt drink", price: 3.49, imageName: "cup.and.saucer.fill", category: "Beverages", shopId: ShopIds.quickBite),
            Product(name: "Pakora (4pc)", description: "Fried vegetable fritters", price: 4.99, imageName: "fork.knife", category: "Snacks", shopId: ShopIds.quickBite),
        ],
    ]

    /// Single list for previews; uses first restaurant shop.
    static var sampleProducts: [Product] {
        sampleProductsByShop[ShopIds.burgerJoint] ?? []
    }
}
