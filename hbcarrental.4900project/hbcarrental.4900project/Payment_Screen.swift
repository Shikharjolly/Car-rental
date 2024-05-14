//  Payment Screen.swift
//  hbcarrental.4900project
//  Created by Shikhar Jolly on 4/30/24.
//  modified by Ramatoulaye Kebe on 5/13/24

import SwiftUI

struct Payment_Screen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var cardNumber = ""
    @State private var cardName = ""
    @State private var expiryDate = Date()
    @State private var cvv = ""
    @State private var Zipcode = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var total: Double
    var selectedAddOns: [AddOnOption]?
    var carImageName: String

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    goBack()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding(.leading, 20)
                }
                Text("Payment Portal")
                    .padding(.leading, 25)
                    .font(.title)
                    .bold() // Make the text bold
                    .foregroundColor(.black)
                    .font(.system(size: 25))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .padding(.bottom, 10)
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Almost Done!")
                                            .font(.headline) // Adjusted font size and style
                                            .foregroundColor(.black)
                                            .padding(.bottom, 10)
                    
                    Image(carImageName) // Display car image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .padding(.bottom, 10)
                    
                    Text("Total price: $\(total, specifier: "%.2f")")
                        .font(.title)
                        .bold()
                    
                    // Display selected add-ons if available
                    if let addOns = selectedAddOns, !addOns.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Selected Add-ons:")
                                .font(.headline)
                                .padding(.bottom, 5)
                            ForEach(addOns) { addOn in
                                HStack {
                                    Text(addOn.name)
                                    Spacer()
                                    Text("$\(addOn.price, specifier: "%.2f")")
                                }
                            }
                            Divider()
                        }
                        .padding(.horizontal)
                    }
                    
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
                        if allFieldsFilled() {
                            alertMessage = "Thank you for your payment. We appreciate your business!"
                        } else {
                            alertMessage = "Please fill all required fields"
                        }
                        showingAlert = true
                    }) {
                        Text("PROCESS PAYMENT")
                                                    .foregroundColor(.black)
                                                    .bold() // Make the text bold
                                                    .padding(5)
                                                    .background(Color.white)
                                                    .cornerRadius(2)
                                                    .font(.system(size: 20)) // Adjusted font size
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 2)
                                                            .stroke(Color.yellow, lineWidth: 1))
                    }
                    .padding(.top, 10)
                }
                .padding(20)
            }
            .background(Color(.gray).opacity(0.1))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .alert(isPresented: $showingAlert) {
            if alertMessage == "Thank you for your payment. We appreciate your business!" {
                return Alert(title: Text("Payment Processed!"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            } else {
                return Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func processPayment() {
        // Implement logic to process payment here
        print("Payment Processed")
        // Optionally dismiss the view after payment processing is complete
        presentationMode.wrappedValue.dismiss()
    }
    
    private func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
    private func allFieldsFilled() -> Bool {
        return !cardNumber.isEmpty && !cardName.isEmpty && !cvv.isEmpty && !Zipcode.isEmpty
    }
}

struct Payment_Screen_Previews: PreviewProvider {
    static var previews: some View {
        let car = carDatabase[2] // Third car from the database
        return Payment_Screen(total: 100, selectedAddOns: [AddOnOption(name: "Personal driver", price: 8.90),
                                                           AddOnOption(name: "Loss coverage waiver", price: 9.95)], carImageName: car.imageName)
    }
}
