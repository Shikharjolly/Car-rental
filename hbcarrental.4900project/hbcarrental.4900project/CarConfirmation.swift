//  CarConfirmation2.swift
//  hbcarrental.4900project
//
//  Created by Shikhar Jolly on 5/11/24.
//

import SwiftUI

struct AddOnOption: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    var selected: Bool = false
}

struct CarConfirmation: View {
    var total: Double
    var car: Car
    @State private var totalWithAddons: Double
    @State private var addOnOptions: [AddOnOption] = [
        AddOnOption(name: "Personal driver", price: 8.90),
        AddOnOption(name: "Loss coverage waiver", price: 9.95),
        AddOnOption(name: "Full loss coverage waiver", price: 25.0),
        AddOnOption(name: "Additional driver", price: 2.0),
        AddOnOption(name: "Child seat", price: 19.0)
    ]

    init(total: Double, car: Car) {
        self.total = total
        self.car = car
        _totalWithAddons = State(initialValue: total)
    }

    var body: some View {
        ScrollView {
            VStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(car.name)
                    .font(.largeTitle)
                    .bold()
                Text(car.type)
                    .font(.body)
                    .padding()
                VStack {
                    ForEach(addOnOptions.indices, id: \.self) { index in
                        HStack {
                            Text(addOnOptions[index].name)
                            Spacer()
                            Text("\(addOnOptions[index].price, specifier: "%.2f")")
                            Button(action: {
                                totalWithAddons += addOnOptions[index].price
                                addOnOptions[index].selected = true
                            }) {
                                Text("Add")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                            .disabled(addOnOptions[index].selected)
                        }
                    }
                }
                Text("Total: \(totalWithAddons, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                    .padding()
                NavigationLink(destination: Payment_Screen(total: totalWithAddons)) {
                    Text("Proceed")
                        .font(.title)
                        .bold()
                        .padding(5)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct CarConfirmation_Previews: PreviewProvider {
    static var previews: some View {
        CarConfirmation(total: 100.0, car: carDatabase[2])
    }
}
