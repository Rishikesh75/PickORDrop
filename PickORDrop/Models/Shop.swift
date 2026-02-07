//
//  Shop.swift
//  PickORDrop
//

import Foundation

struct Shop: Identifiable, Hashable {
    let id: UUID
    let name: String
    let tagline: String
    let imageName: String?
    let category: StoreCategory

    init(
        id: UUID = UUID(),
        name: String,
        tagline: String,
        imageName: String? = nil,
        category: StoreCategory
    ) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.imageName = imageName
        self.category = category
    }
}
