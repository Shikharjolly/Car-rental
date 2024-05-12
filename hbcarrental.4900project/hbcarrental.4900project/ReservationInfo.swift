//
//  ReservationInfo.swift
//  hbcarrental.4900project
//
import Foundation

struct ReservationInfo {
    var selectedLocation: String
    var returnLocation: String
    var pickupDate: Date
    var returnDate: Date
    var totalPrice: Double
    var car: Car
}
