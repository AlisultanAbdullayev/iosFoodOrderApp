//
//  MainView.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 4.07.2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var categoriesVM = CategoriesViewModel(networkManager: NetworkManager())
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(categoriesVM.categories) { category in
                    NavigationLink {
                        FoodGridView(category: category)
                    } label: {
                        CategoryCoverView(category: category)
                    }
                }
            }
            .padding()
        }
        .tint(.black)
        .listStyle(.plain)
        .task {
            await categoriesVM.fetchCategories()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack(alignment: .top) {
                    Image(systemName: "mappin.and.ellipse")
                    VStack(alignment: .leading) {
                        Text("Санкт-Петербург")
                            .font(.body)
                        Text(DateFormatter.russianDateFormatter.string(from: Date()))
                            .foregroundStyle(.secondary)
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Image(.person)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42.5, height: 42.5)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
