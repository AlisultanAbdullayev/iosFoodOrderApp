//
//  ContentView.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 4.07.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var bucketVM: BucketViewModel
    
    var body: some View {
        TabView {
            NavigationStack {
                MainView()
            }
            .tabItem {
                Label("Главная", systemImage: "house.lodge")
            }
            NavigationStack {
                SearchView()
            }
            .tabItem {
                Label("Поиск", systemImage: "magnifyingglass")
            }
            NavigationStack {
                BucketView()
            }
            .tabItem {
                Label("Корзина", systemImage: "cart")
            }
            .badge(bucketVM.items.count > 0 ? bucketVM.totalQuantity : .zero)
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Аккаунт", systemImage: "person.crop.circle")
            }
        }
    }
}

#Preview {
    ContentView()
}
