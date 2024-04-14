// ContentView.swift
// hbcarrental.4900project
// Created by Ayrat Aymetov 4/10/24.

import SwiftUI

let myColor = Color(red: 14/255, green: 22/255, blue: 24/255)

struct ContentView: View {

    @State private var now = Date()
    @State private var selectedLocation = "Kingston"
    @State private var returnSameLocation = true
    @State private var returnLocation = "Kingston"
    @State private var pickupDate = Date()
    @State private var returnDate = Date()

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HeaderView()
                    .padding(.top, 50)

                Spacer()

                VStack {
                    SectionHeader(title: "PICK UP")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    VStack {
                        HStack {
                            Text("Place to pick up the car")
                            Spacer()
                            Picker("Select pick-up location", selection: $selectedLocation) {
                                ForEach(["Other", "Kingston", "St. Catherine", "Ocho Rios", "Montego Bay"], id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }

                        if !returnSameLocation {
                            HStack {
                                Text("Place to drop off the car")
                                Spacer()
                                Picker("Select return location", selection: $returnLocation) {
                                    ForEach(["Other", "Kingston", "St. Catherine", "Ocho Rios", "Montego Bay"], id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                            }
                        } 

                         Toggle(isOn: $returnSameLocation) {
                            Text("Return to the same location")
                        }
                        .onChange(of: returnSameLocation) { value in
                            if value {
                                returnLocation = selectedLocation
                            }
                        }

                        DatePicker("Pick-up Date", selection: $pickupDate, in: Date()..., displayedComponents: .date)
                        DatePicker("Pick-up Time", selection: $pickupDate, displayedComponents: .hourAndMinute)
                            .modifier(DisablePastDates(date: $pickupDate))
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 1))
                    .padding(.horizontal, 20)

                    SectionHeader(title: "RETURN")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    VStack {
                        DatePicker("Drop Date", selection: $returnDate, in: pickupDate..., displayedComponents: .date)
                        DatePicker("Drop Time", selection: $returnDate, displayedComponents: .hourAndMinute)
                            .modifier(DisablePastTimes(date: $returnDate, pickupDate: pickupDate))
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 1))
                    .padding(.horizontal, 20)

                    NavigationLink(destination: ReservationView(selectedLocation: selectedLocation,
                                                                returnLocation: returnLocation, 
                                                                pickupDate: pickupDate, 
                                                                returnDate: returnDate)) {
                        Text("Continue reservation")
                            .foregroundColor(.black)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                    }

                    Button("Start over") {
                        withAnimation {
                            self.selectedLocation = "Choose Office"
                            self.returnSameLocation = true
                            self.pickupDate = Date()
                            self.returnDate = Date()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    .foregroundColor(.red)
                    .underline()
                    .font(.headline)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }

                Spacer()

                InfoView()
                    .padding(.top, 20)

                BottomView()
                    .padding(.top, 20)
                    .padding(.bottom, 20)
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct DisablePastDates: ViewModifier {
    @Environment(\.calendar) var calendar
    @Binding var date: Date

    func body(content: Content) -> some View {
        content
            .onChange(of: date) { newValue in
                if calendar.isDate(newValue, inSameDayAs: Date()) && newValue < Date().addingTimeInterval(60*60) {
                    date = Date().addingTimeInterval(60*60)
                } else if newValue < Date() {
                    date = Date()
                }
            }
    }
}

struct DisablePastTimes: ViewModifier {
    @Environment(\.calendar) var calendar
    @Binding var date: Date
    var pickupDate: Date

    func body(content: Content) -> some View {
        content
            .onChange(of: date) { newValue in
                if calendar.isDate(newValue, inSameDayAs: pickupDate) && newValue < pickupDate.addingTimeInterval(60*60) {
                    date = pickupDate.addingTimeInterval(60*60)
                }
            }
    }
}

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.top, 20)
            .padding(.bottom, 10)
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 0) { 
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .background(myColor)

            HStack {
                Text("800-458-6440")
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "line.horizontal.3")
                }
            }
            .padding()
            .background(myColor)
            .foregroundColor(.yellow)
        }
    }
}

struct InfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InfoBlock(title: "Lowest Rates Guarantee", image: "hand_icon", text: "Who says you can’t get great service at the lowest rates? HBC is not only the highest customer-rated rental agency but also beats the lowest competitor’s prices.")
            InfoBlock(title: "Low or No Deposit", image: "smile_icon", text: "At only $ 200 USD, our security deposit is among the lowest in Jamaica! HBC typically waives deposits for regular customers.")
            InfoBlock(title: "Free Car Delivery", image: "map_icon", text: "Book your car and we will deliver it to you wherever you are in Jamaica. Free delivery for rentals over 7 days.")
            Spacer()
        }
    }
}

struct InfoBlock: View {
    let title: String
    let image: String
    let text: String

    var body: some View {
        VStack(alignment: .leading) { 
            HStack {
                Image(image) 
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.accentColor) 
                Text(title)
                    .font(.headline) 
                    .fontWeight(.bold) 
            }
            Text(text)
                .font(.subheadline)
                .padding(.top, 4) 
                .padding(.trailing) 
        }
        .padding(.horizontal) 
    }
}

struct BottomView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("HummingBird Car Rental is the #1 Customer-rated Car Rental company in Jamaica. HBC brings value to car rental in Jamaica. HummingBird offers low rates, low deposits, and world-class service. We offer car rental in Kingston, Montego Bay, Ocho Rios, and every other major city in all 14 parishes.")
                .padding(.top)
                .foregroundColor(.gray)

            Divider()

            HStack {
                VStack(alignment: .leading) {
                    Text("HELPFUL LINKS")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    VStack(alignment: .leading, spacing: 20) {
                        Link(destination: URL(string: "https://www.example.com/faqs")!) {
                            Text("FAQs")
                        }
                        Link(destination: URL(string: "https://www.example.com/travel-blog")!) {
                            Text("Travel Blog")
                        }
                        Link(destination: URL(string: "https://www.example.com/rental-terms")!) {
                            Text("Rental Terms")
                        }
                        Link(destination: URL(string: "https://www.example.com/contact-us")!) {
                            Text("Contact Us")
                        }
                    }
                    .padding(.top, 10) 
                }
                .padding(.trailing, 20)

                VStack(alignment: .leading) {
                    Text("CUSTOMER PORTAL")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    VStack(alignment: .leading, spacing: 20) {
                        Link(destination: URL(string: "https://www.example.com/login")!) {
                            Text("Log In")
                        }
                        Link(destination: URL(string: "https://www.example.com/my-account")!) {
                            Text("My Account")
                        }
                        Link(destination: URL(string: "https://www.example.com/logout")!) {
                            Text("Log Out")
                        }
                        Link(destination: URL(string: "https://www.example.com/register")!) {
                            Text("Register")
                        }
                    }
                    .padding(.top, 10) 
                }
            }
            .frame(maxWidth: .infinity)

            HStack {
                Image("insta_icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)

                Link(destination: URL(string: "https://www.instagram.com/hummingbird_carrentals/")!) {
                    Text("HummingBird Car Rentals")
                }
            }
            .padding(.leading, 20)

            .padding(.top)
        }
        .padding()
        .background(myColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
