//
//  BucketItem.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 7.07.2023.
//

import Foundation

class BucketItem: Identifiable {
    let id = UUID().uuidString
    let dish: Dish
    var quantity: Int
    
    init(dish: Dish, quantity: Int) {
        self.dish = dish
        self.quantity = quantity
    }
}
