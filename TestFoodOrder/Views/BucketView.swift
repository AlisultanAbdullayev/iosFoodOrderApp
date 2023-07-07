//
//  BucketView.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 4.07.2023.
//

import SwiftUI

struct BucketView: View {
    
    @EnvironmentObject var bucketVM: BucketViewModel
    
    var body: some View {
        VStack {
            if bucketVM.items.isEmpty {
                Text("Ваша корзина пуста!")
                    .font(.title2)
                    .foregroundStyle(.secondary)
            } else  {
                List(bucketVM.items) { item in
                    FoodRowView(dish: item.dish, quantity: item.quantity)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                buttonSection
            }
        }
        .padding()
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
    
    private var buttonSection: some View {
        Button {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        } label: {
            Text("\(bucketVM.totalPrice)₽")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    Color.accentColor
                        .clipShape(RoundedRectangle(cornerRadius: 10)
                                  )
                )
        }
        .tint(.white)
        .bold()
        .padding(.top)
    }
}

#Preview {
    BucketView()    
}
