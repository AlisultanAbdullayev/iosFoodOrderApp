//
//  BucketViewModel.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 7.07.2023.
//

import Foundation

@MainActor
final class BucketViewModel: ObservableObject {
    
    @Published private(set) var items = [BucketItem]()
    @Published private(set) var totalPrice = 0
    @Published private(set) var totalQuantity = 0
    
    func addCartItem(dish: Dish) {
        let tempItem = items.first { $0.dish.id == dish.id }
        if let tempItem {
            tempItem.quantity += 1
            totalPrice += dish.price
            totalQuantity += 1
        } else {
            items.append(BucketItem(dish: dish, quantity: 1))            
            totalPrice += dish.price
            totalQuantity += 1
        }
    }
        
    func removeFromCart(dish: Dish) {
        let tempItem = items.first { $0.dish.id == dish.id }
        if let tempItem {
            tempItem.quantity -= 1
            totalQuantity -= 1
            totalPrice -= dish.price
            if tempItem.quantity == 0 {
                let indexOfItem = items.firstIndex(where: { $0.dish.id == dish.id })
                if let indexOfItem {
                    items.remove(at: indexOfItem)
                }
            }
        }
    }
    
}
