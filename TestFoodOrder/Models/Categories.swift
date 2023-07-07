//
//  Categories.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 4.07.2023.
//

import Foundation

// MARK: - Categories
struct Categories: Codable {
    let сategories: [ProductCategory]
}

// MARK: - Сategory
struct ProductCategory: Codable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
    
}
