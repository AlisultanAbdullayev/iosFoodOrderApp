//
//  CategoriesViewModel.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 5.07.2023.
//

import Foundation

@MainActor
final class CategoriesViewModel: ObservableObject {
    
    @Published private(set) var categories: [ProductCategory] = []
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchCategories() async {
        do {
            let response = try await networkManager
                .fetch(type: Categories.self,
                       from: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54")
            categories = response.сategories
        } catch {
            print(error)
        }
    }
    
}
