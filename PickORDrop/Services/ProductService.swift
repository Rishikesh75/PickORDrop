//
//  ProductService.swift
//  PickORDrop
//

import Foundation

/// Provides product catalog. Replace with API later.
protocol ProductServiceProtocol {
    func fetchProducts() async -> [Product]
}

final class ProductService: ProductServiceProtocol {
    func fetchProducts() async -> [Product] {
        // Simulate network delay
        try? await Task.sleep(nanoseconds: 300_000_000)
        return Product.sampleProducts
    }
}

// MARK: - Sample Data
extension Product {
    static let sampleProducts: [Product] = [
        Product(
            name: "Fresh Burger",
            description: "Juicy beef patty with lettuce and special sauce",
            price: 8.99,
            imageName: "fork.knife",
            category: "Food"
        ),
        Product(
            name: "Crispy Fries",
            description: "Golden crispy fries with seasoning",
            price: 3.49,
            imageName: "frying.pan",
            category: "Food"
        ),
        Product(
            name: "Cold Brew",
            description: "Smooth cold brew coffee",
            price: 4.99,
            imageName: "cup.and.saucer.fill",
            category: "Drinks"
        ),
        Product(
            name: "Chocolate Shake",
            description: "Rich chocolate milkshake",
            price: 5.49,
            imageName: "birthday.cake.fill",
            category: "Drinks"
        ),
        Product(
            name: "Garden Salad",
            description: "Fresh greens with vinaigrette",
            price: 6.99,
            imageName: "leaf.fill",
            category: "Food"
        ),
    ]
}
