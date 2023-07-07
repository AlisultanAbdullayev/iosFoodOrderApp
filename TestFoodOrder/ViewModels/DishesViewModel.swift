//
//  DishesViewModel.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 6.07.2023.
//

import Foundation
import SwiftUI

@MainActor
final class DishesViewModel: ObservableObject {
    
    @Published private(set) var dishes = [Dish]()
    @Published var sortedDishes = [Dish]()
    private let networkManager: NetworkManager
    @Published var selectedTeg = Teg.всеМеню
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchDishes() async {
        do {
            let response = try await networkManager
                .fetch(type: Dishes.self,
                       from: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
            dishes = response.dishes
        } catch {
            print(error)
        }
    }
    
    func sortDishes(teg: Teg = Teg.всеМеню, dishes: [Dish]) -> [Dish] {
        withAnimation(.none) {
            selectedTeg = teg
        }
        dishes.forEach { dish in
          if dish.tegs.contains(where: { $0 == teg }) {
            sortedDishes.append(dish)
          }
        }
        return sortedDishes
    }
    
}
