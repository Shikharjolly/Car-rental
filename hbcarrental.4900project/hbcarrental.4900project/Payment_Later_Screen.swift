//
//  Payment_Later_Screen.swift
//  hbcarrental.4900project
//  Created by Ramatoulaye Kebe on 5/12/24.

import SwiftUI

struct Payment_Later_Screen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var emailAddress = ""
    @State private var driverLicense = ""
    @State private var countryRegion = ""
    @State private var streetAddress = ""
    @State private var townCityPostOffice = ""
    @State private var parish = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var total: Double
    var car: Car
    var addOns: [AddOnOption]?

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
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 25))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .padding(.bottom, 10)
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Almost Done!")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    Image(car.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .padding(.bottom, 10)
                    
                    // Display selected add-ons if available
                    if let addOns = addOns, !addOns.isEmpty {
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
                    
                    Group {
                        HStack {
                            Text("Total price: $\(total, specifier: "%.2f")*")
                                .font(.title)
                                .bold()
                        }
                        .padding(.bottom, 10)
                        .padding(.leading, 20)
                        
                        TextField("First Name", text: $firstName)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                        
                        // Other text fields
                        // Example:
                        TextField("Last Name", text: $lastName)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                        
                        TextField("Phone Number", text: $phoneNumber)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                        
                        TextField("Email Address", text: $emailAddress)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                        
                        TextField("Driver's License (Optional)", text: $driverLicense)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                        
                        TextField("Country/Region (Optional)", text: $countryRegion)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                        
                        TextField("Street Address (Optional)", text: $streetAddress)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                        
                        TextField("Town/City/Post Office (Optional)", text: $townCityPostOffice)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                        
                        TextField("Parish (Optional)", text: $parish)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)
                    }
                    
                    Button(action: {
                        if allFieldsFilled() {
                            alertMessage = "Thank you for your reservation. We'll contact you shortly."
                        } else {
                            alertMessage = "Please fill all required fields"
                        }
                        showingAlert = true
                    }) {
                        HStack {
                            Text("* Payment is to be made with cash upon delivery.")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding(.top, 10)
                                .padding(.bottom, 15)
                                .padding(.leading, 20)
                        }
                        Text("Place Order")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                }
                .padding(20)
            }
            .background(Color(.gray).opacity(0.1))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .alert(isPresented: $showingAlert) {
            if alertMessage == "Thank you for your reservation. We'll contact you shortly." {
                return Alert(title: Text("Reservation Successful!"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            } else {
                return Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func allFieldsFilled() -> Bool {
        // Implement your validation logic here
        return !firstName.isEmpty && !lastName.isEmpty && !phoneNumber.isEmpty && !emailAddress.isEmpty
    }
    
    private func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct Payment_Later_Screen_Previews: PreviewProvider {
    static var previews: some View {
        let car = carDatabase[2] // Assuming the car chosen by the customer is the third one from the database
        let selectedAddOns: [AddOnOption]? = [AddOnOption(name: "Personal driver", price: 8.90),
                                               AddOnOption(name: "Loss coverage waiver", price: 9.95)]
        return Payment_Later_Screen(total: 100.0, car: car, addOns: selectedAddOns)
    }
}
