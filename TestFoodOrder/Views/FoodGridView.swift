//
//  FoodGridView.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 4.07.2023.
//

import SwiftUI

struct FoodGridView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var isShowDetailView = false
    @StateObject private var dishesVM = DishesViewModel(networkManager: NetworkManager())
    @State private var tempDish: Dish? = nil
    let category: ProductCategory
    @State private var teg = Teg.всеМеню
    
    let columns = [
         GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible()),
    ]
    
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView(.vertical, showsIndicators: true) {
                categorySection
                foodsGridSection
            }
            .padding(.horizontal)
            foodDetailsView
        }
        .task {
            await dishesVM.fetchDishes()
            dishesVM.sortedDishes = dishesVM.sortDishes(teg: .всеМеню, dishes: dishesVM.dishes)
        }
        .navigationTitle(category.name)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .tint(.black)
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
    
    private var categorySection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(Teg.allCases, id: \.self) { tempTeg in
                    Button {
                        dishesVM.sortedDishes = []
                        dishesVM.sortedDishes = dishesVM.sortDishes(teg: tempTeg, dishes: dishesVM.dishes)
                    } label: {
                        Text(tempTeg.rawValue)
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(dishesVM.selectedTeg == tempTeg ? Color.accentColor : .gray.opacity(
                                  0.25))
                    )
                    .tint(dishesVM.selectedTeg == tempTeg ? .white : .black)
                }
            }
        }
        .padding(.vertical)
    }
    
    private var foodsGridSection: some View {
        LazyVGrid(columns: columns) {
            ForEach(dishesVM.sortedDishes) { dish in
                Button(action: {
                    isShowDetailView = true
                    tempDish = dish
                }, label: {
                    FoodCoverView(food: dish)
                })
                .tint(Color(.label))
            }
        }
    }
    
    @ViewBuilder
    private var foodDetailsView: some View {
        if isShowDetailView, let tempDish = tempDish {
            Color.gray.opacity(0.25)
                .ignoresSafeArea()
                .onTapGesture {
                        isShowDetailView = false
                }
            FoodDetailsView(isShowDetailView: $isShowDetailView, dish: tempDish)
        } else {
            EmptyView()
        }
    }
    
}

#Preview {
    FoodGridView(category: ProductCategory(id: 1, name: "A", imageURL: "B"))
}
