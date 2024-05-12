// ReservationView.swift
// hbcarrental.4900project

import SwiftUI

struct ReservationView: View {
    var selectedLocation: String
    var returnLocation: String
    var pickupDate: Date
    var returnDate: Date

    //added line
    @State private var reservationInfo: ReservationInfo?

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: pickupDate, to: returnDate)
        let numberOfHours = components.hour ?? 0
        let numberOfDays = numberOfHours / 24
        let remainingHours = numberOfHours % 24

        ScrollView {
            VStack(spacing: 10) {
                HeaderView_Reservation

                VStack(spacing: 0) {
                    VStack {
                        HStack(alignment: .center, spacing: 90) {
                            Image("check_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Text("Your Itinerary")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 140, alignment: .center) 
                                .multilineTextAlignment(.center) 
                        }
                        .background(Color.black.opacity(0.5))
                        .frame(width: 600)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        let timeFormatter: DateFormatter = {
                            let formatter = DateFormatter()
                            formatter.dateStyle = .none
                            formatter.timeStyle = .short
                            return formatter
                        }()
                        Text("Pick-up Location: \(selectedLocation)")
                        Text("Return Location: \(returnLocation)")
                        Text("Pick-up Date: \(pickupDate, formatter: dateFormatter)")
                        Text("Pick-up Time: \(pickupDate, formatter: timeFormatter)")
                        Text("Drop-off Date: \(returnDate, formatter: dateFormatter)")
                        Text("Drop-off Time: \(returnDate, formatter: timeFormatter)")
                    }
                    .foregroundColor(.black)
                    .padding()
                    .padding(.horizontal, 10) 
                    .background(Color.white)
                    .frame(width: 600)
                }

                VStack (){
                    HStack(alignment: .center, spacing: 90) {
                        Image("two_icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                            .frame(width: 40)
                        Text("Select Vehicle")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: 600)
                    .background(Color.black.opacity(0.5))
                }

                Spacer()

                .background(Color.gray.opacity(0.1))
            }
            .background(
                Image("background_reservation_view")
                    .resizable()
                    .scaledToFit()
            )

            VStack {
                Spacer()
                ForEach(carDatabase.indices, id: \.self) { index in

                    let totalPrice = Double(numberOfHours) * carDatabase[index].pricePerHour
                    let discountedPrice = totalPrice * (1 - carDatabase[index].discountPayNow)
                    let savings = totalPrice * carDatabase[index].discountPayNow
                    
                    VStack {
                        HStack {
                            Image(carDatabase[index].imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)

                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    Text(carDatabase[index].type)
                                        .fontWeight(.bold)
                                        .font(.system(size: 13))
                                    Text(carDatabase[index].name)
                                        .font(.system(size: 12))
                                    HStack {
                                        HStack {
                                            Image("seat_icon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 11, height: 11)
                                            Text("\(carDatabase[index].numberOfSeats) seats")
                                                .font(.system(size: 11))
                                        }
                                        HStack {
                                            Image("suitcase_icon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 11, height: 11)
                                            Text("\(carDatabase[index].numberOfBags) bags")
                                                .font(.system(size: 11))
                                        }
                                        HStack {
                                            Image("door_icon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 11, height: 11)
                                            Text("\(carDatabase[index].numberOfDoors) doors")
                                                .font(.system(size: 11))
                                        }
                                    }
                                    HStack{
                                        HStack{
                                            Image("snowflake_icon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 11, height: 11)
                                            Text(carDatabase[index].acMode)
                                                .font(.system(size: 11))
                                        }
                                        Text("more infomration")
                                            .font(.system(size: 11))
                                    }
                                }
                            }
                        }
                        .padding(.top, 5)
                        .padding(.horizontal)
                        
                        HStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("$\(totalPrice, specifier: "%.2f")/Total")
                                        .font(.system(size: 11))
                                    Text("\(numberOfDays) days / \(remainingHours) hours")
                                        .font(.system(size: 8))
                                    Text(" ")
                                        .font(.system(size: 8)) 
                                }
                                NavigationLink(destination: CarConfirmation(total: totalPrice, car: carDatabase[index])) {
                                    Text("PAY LATER")
                                        .foregroundColor(.black)
                                        .padding(5)
                                        .background(Color.white)
                                        .cornerRadius(2)
                                        .font(.system(size: 10))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 2)
                                                .stroke(Color.yellow, lineWidth: 1)
                                        )
                                }
                                .onTapGesture {
                                    reservationInfo = ReservationInfo(selectedLocation: selectedLocation, returnLocation: returnLocation, pickupDate: pickupDate, returnDate: returnDate, totalPrice: totalPrice, car: carDatabase[index])
                                }
                            }

                            HStack {
                                VStack(alignment: .leading) {
                                    Text("$\(discountedPrice, specifier: "%.2f")/Total")
                                        .font(.system(size: 11))
                                    Text("\(numberOfDays) days / \(remainingHours) hours")
                                        .font(.system(size: 8))                               
                                    Text("SAVES YOU $\(savings, specifier: "%.2f")")
                                        .font(.system(size: 8))
                                }
                                NavigationLink(destination: CarConfirmation(total: discountedPrice, car: carDatabase[index])) {
                                    Text("PAY NOW")
                                        .foregroundColor(.black)
                                        .padding(5)
                                        .background(Color.white)
                                        .cornerRadius(2)
                                        .font(.system(size: 10))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 2)
                                                .stroke(Color.yellow, lineWidth: 1)
                                        )
                                }
                                .onTapGesture {
                                    reservationInfo = ReservationInfo(selectedLocation: selectedLocation, returnLocation: returnLocation, pickupDate: pickupDate, returnDate: returnDate, totalPrice: discountedPrice, car: carDatabase[index])
                                }
                            }
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 1, x: 0, y: 1)
                    .frame(width: UIScreen.main.bounds.width * 0.90)
                }
            }
        }
        .background(Color.gray.opacity(0.2))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)  
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    private func goBack() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private var HeaderView_Reservation: some View {
        HStack() {
            Button(action: {
                goBack()
            }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.yellow)
            }
            .padding(.leading, 10)
            .padding(.trailing, 70)

            Text("RESERVATION")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            Spacer()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .background(myColor)
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView(selectedLocation: "Location", returnLocation: "Location", pickupDate: Date(), returnDate: Date())
    }
}