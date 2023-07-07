//
//  Extensions.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 7.07.2023.
//

import Foundation


extension DateFormatter {
    static let russianDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        return dateFormatter
    }()
}
