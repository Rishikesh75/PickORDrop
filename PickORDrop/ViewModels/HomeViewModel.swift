//
//  HomeViewModel.swift
//  PickORDrop
//

import Foundation

@Observable
final class HomeViewModel {
    private let shopService: ShopServiceProtocol
    private let productService: ProductServiceProtocol
    private let cartService: CartService

    var selectedCategory: StoreCategory?
    var shops: [Shop] = []
    var selectedShop: Shop?
    var products: [Product] = []

    var isLoadingShops = false
    var isLoadingProducts = false
    var errorMessage: String?

    init(
        shopService: ShopServiceProtocol = ShopService(),
        productService: ProductServiceProtocol = ProductService(),
        cartService: CartService
    ) {
        self.shopService = shopService
        self.productService = productService
        self.cartService = cartService
    }

    var cartCount: Int {
        cartService.cartCount
    }

    func selectCategory(_ category: StoreCategory) {
        selectedCategory = category
        selectedShop = nil
        products = []
    }

    func selectShop(_ shop: Shop) {
        selectedShop = shop
    }

    func clearCategorySelection() {
        selectedCategory = nil
        shops = []
        selectedShop = nil
        products = []
    }

    func clearShopSelection() {
        selectedShop = nil
        products = []
    }

    func loadShops() async {
        guard let category = selectedCategory else { return }
        isLoadingShops = true
        errorMessage = nil
        defer { isLoadingShops = false }
        shops = await shopService.fetchShops(category: category)
    }

    func loadProducts() async {
        guard let shop = selectedShop else { return }
        isLoadingProducts = true
        errorMessage = nil
        defer { isLoadingProducts = false }
        products = await productService.fetchProducts(shopId: shop.id)
    }

    func addToCart(_ product: Product, quantity: Int = 1) {
        cartService.add(product: product, quantity: quantity)
    }
}
