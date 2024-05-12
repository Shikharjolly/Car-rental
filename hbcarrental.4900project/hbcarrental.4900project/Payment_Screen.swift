//  Payment Screen.swift
//  hbcarrental.4900project
//
//  Created by Shikhar Jolly on 4/30/24.

import SwiftUI

struct Payment_Screen: View {
    @State private var cardNumber = ""
    @State private var cardName = ""
    @State private var expiryDate = Date()
    @State private var cvv = ""
    @State private var Zipcode = ""

    var total: Double

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding(.leading, 20)
                Text("Payment Portal")
                    .padding(.leading, 25)
                    .font(.title)
                    .foregroundColor(.black)
                    .font(.system(size: 25))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .padding(.bottom, 10)

            ScrollView {
                VStack(alignment: .leading) {

                    Text("Almost Done!")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    Text("Total price: \(total, specifier: "%.2f")")
                        .font(.title)
                        .bold()

                    TextField("Name on card", text: $cardName)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .shadow(color: .gray, radius: 2, x: 2, y: 2)
                        .padding(.bottom, 10)
                    TextField("Card Number", text: $cardNumber)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .shadow(color: .gray, radius: 2, x: 2, y: 2)
                        .padding(.bottom, 10)
                    TextField("ZipCode", text: $Zipcode)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .shadow(color: .gray, radius: 2, x: 2, y: 2)
                        .padding(.bottom, 10)

                    HStack {
                        DatePicker("Expiry Date", selection: $expiryDate, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(CompactDatePickerStyle())
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)

                        TextField("CVV", text: $cvv)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                    }

                    Button(action: {
                        print("Payment Processed")
                    }) {
                        Text("Process Payment")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.top, 20)
                }
                .padding(20)
            }
            .background(Color(.gray).opacity(0.1))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct Payment_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Payment_Screen(total: 100)
    }
}

