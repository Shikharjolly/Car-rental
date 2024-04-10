/*
ContentView.swift
hbcarrental.4900project
Created by Ayrat Aymetov 4/10/24.
*/

import SwiftUI
import Foundation

struct ReservationView: View {
    var selectedLocation: String
    var pickupDate: Date
    var returnDate: Date

    var body: some View {
        VStack {
            Text("Reservation for \(selectedLocation)")
            Text("Pickup Date: \(pickupDate)")
            Text("Return Date: \(returnDate)")
        }
        .padding()
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView(selectedLocation: "Location", pickupDate: Date(), returnDate: Date())
    }
}