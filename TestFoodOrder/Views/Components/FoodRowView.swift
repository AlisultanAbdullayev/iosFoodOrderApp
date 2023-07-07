//
//  FoodRowView.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 4.07.2023.
//

import SwiftUI

struct FoodRowView: View {
    
    let dish: Dish
    var quantity: Int
    @EnvironmentObject var bucketVM: BucketViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: dish.imageURL)) { image in
                image
                    .resizable()
            } placeholder: {
                Color.gray.opacity(0.25)
            }
            VStack(alignment: .leading) {
                Text(dish.name)
                HStack {
                    Text("\(dish.price)₽")
                    Text("*")
                        .foregroundStyle(.secondary)
                    Text("\(dish.weight)г")
                        .foregroundStyle(.secondary)
                }
                .font(.subheadline)
            }
            Spacer()
            MyStepper(dish: dish, value: .constant(quantity), in: 0...10, label: {})
        }
        .frame(height: 75)
    }
}

struct MyStepper<Label: View>: View {
    
    @EnvironmentObject var bucketVM: BucketViewModel
    let dish: Dish
    @Binding var value: Int
    var `in`: ClosedRange<Int> // todo
    @ViewBuilder var label: Label

    var body: some View {
        HStack {
            label
            Spacer()
            HStack {
                Button("-") { if (value != 0) { value -= 1;  bucketVM.removeFromCart(dish: dish)}; UIImpactFeedbackGenerator(style: .rigid).impactOccurred()  }
                Text(value.formatted())
                Button("+") { value += 1; bucketVM.addCartItem(dish: dish); UIImpactFeedbackGenerator(style: .rigid).impactOccurred() }
            }
            .foregroundStyle(.black)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .foregroundColor(.white)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.25))
            }
        }
        .buttonStyle(.borderless)
    }
}

#Preview {
    FoodRowView(dish: Dish(id: 1,
                           name: "Салат по восточному",
                           price: 699,
                           weight: 360,
                           description: "Салат по восточному - это здоровое и вкусное блюдо, которое мы готовим в нашем ресторане. Он состоит из свежей зелени, овощей, таких как огурцы, помидоры, красный лук и оливки, а также сыра фета и пряных специй, которые придают ему уникальный вкус и аромат. Наше блюдо хорошо сочетается с другими блюдами нашего меню, а также может служить отдельным легким обедом или перекусом",
                           imageURL: "https://lh3.googleusercontent.com/fife/APg5EOafwbErJPvjpg_yUmo7-sLRLWZF08C8k6VCCW3lGRyMVGbSnmfUxl1sNzL0oVfwT2cBZDlCMhNi6XBmrMU3zfX_wCbuT3dXN-dVGbl5ccr0NZyKwmee6geavwEEjDPIpAI0TSSoSIW5ESD42sxXblAKnt4vpETfa4MZYRBj6_0FIY9z2iPJHViTigN-vDdCPnq5RgC3f2-HZ1Algs_e5iSbauXwknae6sINa8JiZY9XdGT-qwsXivIrNakp5X4SkYUXTPfm4B9iBBuoO2SlLzDmPU8i6gglA1hNCM6ou2A0OK4x-to0plYfCz3Gpbl3c42iNqyBDi6wgiEKNP5DwyMCwrlQvfCdiXOinp6zXHqGBhV-54nl1bySMOB7oTd-iIIiG9b-P6OkNdpeMXb6INgW2looGoM_LXbEoD9HZ_QsopwtqGF5eDbeNTm4n6D7wiZX4rCpkukKNhS48Ne-cUIPAonEs0LfBEReGhiPBAsieaGqKxCS3ovW93w72qsGehL6hg_Wmxe_LOkwu-UHXyjPbUX8LfMLcL0ZdME2VOSkNnqbnR70TPBk3SJHlH3UOfsEzkxra1voEtM9hVJHgiX8kPm5Ym2V7CPYIXxaAN268ui47S07NUu1vhTOrYcdmn2zmJR8k0l1-zcG1WAx1fgKbnqbtezZ9VfYKRlLAtlsD8h86C4yUhQt74DkbfENrHZmLzVORTlYCi40wlIlAL1UsOzvR26163HYl-ZkRA-71199d3Dxr2T2Nv5IPoJmDuJACqu6FzxT71t_Q3-ZKPzNgt7fGpDf_4Xc9dC7G9lvQKpCMv8d3AVkZjf6czQoETmC7Hf6-9GdAp4jqGGztYRmR7wN11mrucEUzg63Mh5hh5bmbt93SctR_gnlt6rbyqo1aYu0p7xw6z02kyQWspnCPpinOMxLmeOI0TIsaqjq7-2VMWD04vMsYA1uVY3gYaST8IXA62ltb1ngSF6A4Qo3FtBgm1LS2yC-KxywiWSCCWwuv0WOc79dUxMl22XcUt4J_bIB0uyjIOmqD-uPGzger-dP6ZiM8_rBhNz40pJ0gWblxWoc6tpWgbhpTPBCCK7e91t3_pmlbh56EQrsKycQHHfTIVe7clQblWHI-Y9qX12WW5jn8QgmAbeAcjEBiqGLfMpWWdCs97HTZAgNYXhikTBXcqCRayvTvZRK5SiNeDzcxSdpLRyG72H6glEyYBL96KuSB1VuylT1APbBcABbDzEvTyNZWZER_NQwu9X5qDxeLmTwyHr0xq_igNaFxMxYDyYqiaAaIuFwG5yQ9d8fnMVo4QYa1HjoB8vVJrHtd2EJltEKe8KgVxjAVQyaSI7ZWwAzJXt4_3bsIgqKzY8ZLdY-xQHtorLRa_GaCaX-KasXOKJKm7nUNQuX3uJS8BlnS_HqJZoIbjRfHEkC2bXEhT7o2NBwMb4Cr87CBQIDjKsXQs8P6bTDsUH96YC4IOiqCL9kVsl6S2rPXd-WDGjk1p9Eqeq6dNUKZVrhalk_dkbsFO6fvGVK3iI8ARoJYbrCThL8EFEUqY58iAYLjDnmmaJH8fN0Odi-QOCLolKiAXg3idpp_hbkqIsncxcmVXYOOSvm1xpMTxq93rV8w_hDEA4Sxi4EjSiom6m3uTWHo0CBtLPa=w1366-h617",
                           tegs: [.сРисом, .сРыбой]), quantity: 1)
}
