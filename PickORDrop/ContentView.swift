//
//  ContentView.swift
//  PickORDrop
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainTabView()
            .environment(CartService())
            .environment(LocationService())
    }
}

#Preview {
    ContentView()
}
