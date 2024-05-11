// ReservationView.swift
// hbcarrental.4900project

import SwiftUI

struct ReservationView: View {
    var selectedLocation: String
    var returnLocation: String
    var pickupDate: Date
    var returnDate: Date

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
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
                                    Text("$548.80/Total")
                                        .font(.system(size: 11))
                                    Text("7 days / 0 hours")
                                        .font(.system(size: 8))
                                    Text("SAVES YOU $123.20")
                                        .font(.system(size: 8))
                                }
                                Button(action: {}) {
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
                            }

                            HStack {
                                VStack(alignment: .leading) {
                                    Text("$672.00/Total")
                                        .font(.system(size: 11))
                                    Text("7 days / 0 hours")
                                        .font(.system(size: 8))
                                    Text(" ")
                                        .font(.system(size: 8))
                                }
                                Button(action: {}) {
                                    Text("PAY NOW")
                                        .foregroundColor(.black)
                                        .padding(5)
                                        .background(Color.yellow)
                                        .cornerRadius(2)
                                        .font(.system(size: 10))
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