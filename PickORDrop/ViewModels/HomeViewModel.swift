//
//  HomeViewModel.swift
//  PickORDrop
//

import Foundation

@Observable
final class HomeViewModel {
    private let productService: ProductServiceProtocol
    private let cartService: CartService

    var products: [Product] = []
    var isLoading = false
    var errorMessage: String?

    init(productService: ProductServiceProtocol = ProductService(), cartService: CartService) {
        self.productService = productService
        self.cartService = cartService
    }

    var cartCount: Int {
        cartService.cartCount
    }

    func loadProducts() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            products = await productService.fetchProducts()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func addToCart(_ product: Product, quantity: Int = 1) {
        cartService.add(product: product, quantity: quantity)
    }
}
