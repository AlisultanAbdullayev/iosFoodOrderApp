//
//  CategoryCoverView.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 4.07.2023.
//

import SwiftUI

struct CategoryCoverView: View {
    
    let category: ProductCategory
    
    var body: some View {
        AsyncImage(url: URL(string: category.imageURL)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.gray.opacity(0.1)
        }
        .frame(height: 150)
        .overlay(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Text(category.name)
                    .multilineTextAlignment(.leading)
            }
            .frame(width: 150, alignment: .leading)
            .multilineTextAlignment(.leading)
            .font(.title3)
            .bold()
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CategoryCoverView(category: ProductCategory(id: 1, name: "Alisultan", imageURL: ""))
        .previewLayout(.sizeThatFits)
}
