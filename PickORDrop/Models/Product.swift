//
//  Product.swift
//  PickORDrop
//

import Foundation

struct Product: Identifiable, Hashable {
    let id: UUID
    let name: String
    let description: String
    let price: Decimal
    let imageName: String?
    let category: String

    init(
        id: UUID = UUID(),
        name: String,
        description: String,
        price: Decimal,
        imageName: String? = nil,
        category: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.imageName = imageName
        self.category = category
    }
}
