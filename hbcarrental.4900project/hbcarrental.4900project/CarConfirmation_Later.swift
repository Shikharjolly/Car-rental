//
//  CarConfirmation_Later.swift
//  hbcarrental.4900project
//
//  Created by Ramatoulaye Kebe on 5/13/24.
//

import SwiftUI

struct AddOnOption_Later: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    var selected: Bool = false
}

struct CarConfirmation_Later: View {
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

    @State private var selectedAddOns: [AddOnOption] = [] // Store selected add-ons

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
                                
                                // Append selected add-on to the array
                                selectedAddOns.append(addOnOptions[index])
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
                    .padding(.trailing)
                    
                    NavigationLink(destination: Payment_Later_Screen(total: totalWithAddons, car: car, addOns: selectedAddOns)) {
                        Text("Pay Later")
                            .foregroundColor(.black)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                    
                }
            }
        }
    }
}

struct CarConfirmationLater_Previews: PreviewProvider {
    static var previews: some View {
        CarConfirmation(total: 100.0, car: carDatabase[2])
    }
}


