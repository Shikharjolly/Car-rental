// ContentView.swift
// hbcarrental.4900project
// Created by Ayrat Aymetov 4/10/24.

// CarDatabase.swift

import Foundation

struct Car {
    let ID: Int
    let imageName: String
    let type: String
    let name: String
    let numberOfSeats: Int
    let numberOfBags: Int
    let numberOfDoors: Int
    let acMode: String
    let pricePerHour: Double
    let discountPayNow: Double
}

let numberOfCars = carDatabase.count

let carDatabase = [
    Car(ID: 1,
        imageName: "BMW_5_series_icon",
        type: "LUXURY 2", 
        name: "BMW 5 Series", 
        numberOfSeats: 5, 
        numberOfBags: 3, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 4.0,
        discountPayNow: 0.173),
    Car(ID: 2,
        imageName: "2018_Jaguar_XF_White_icon", 
        type: "LUXURY - UPGRADE-1", 
        name: "BJaguar XF", 
        numberOfSeats: 5, 
        numberOfBags: 3, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 4.5,
        discountPayNow: 0),
    Car(ID: 3,
        imageName: "2020_Mercedes_Benz_C_Class_icon", 
        type: "LUXURY - UPGRADE-2", 
        name: "Mercedes Benz CLA200", 
        numberOfSeats: 5, 
        numberOfBags: 3, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 6.72,
        discountPayNow: 0),
    Car(ID: 4,
        imageName: "nissan_note_icon", 
        type: "COMPACT", 
        name: "Nissan Note or Similar", 
        numberOfSeats: 4, 
        numberOfBags: 3, 
        numberOfDoors: 4, 
        acMode: "manual", 
        pricePerHour: 1.32, 
        discountPayNow: 0),
    Car(ID: 5,
        imageName: "Nissan_Note_Hybrid_icon", 
        type: "COMPACT-HYBRID", 
        name: "Nissan Note or Similar", 
        numberOfSeats: 4, 
        numberOfBags: 3, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 2.3,
        discountPayNow: 0.27),
    Car(ID: 6,
        imageName: "Nissan_AD_Van_icon", 
        type: "BASIC ECONOMY", 
        name: "Nissan AD Van or Similar", 
        numberOfSeats: 5, 
        numberOfBags: 4, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 1.84,
        discountPayNow: 0.18),
    Car(ID: 7,
        imageName: "Nissan_Cube_icon", 
        type: "MINI SUV/MPV", 
        name: "Nissan Cube, Juke, or Similar", 
        numberOfSeats: 5, 
        numberOfBags: 2, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 2.21,
        discountPayNow: 0.17),
    Car(ID: 8,
        imageName: "nissan_sylphy_icon", 
        type: "FULL SIZED", 
        name: "Nissan Sylphy or Similar", 
        numberOfSeats: 5, 
        numberOfBags: 4, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 2.46,  
        discountPayNow: 0.12),
    Car(ID: 9,
        imageName: "nissan_serena_car_icon", 
        type: "LARGE MINIVAN", 
        name: "Nissan Serena", 
        numberOfSeats: 8, 
        numberOfBags: 3, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 2.17,  
        discountPayNow: 0),
    Car(ID: 10,
        imageName: "kisspng_2013_mazda5_mazda_icon", 
        type: "COMPACT MINIVAN", 
        name: "Mazda Premacy or Similar", 
        numberOfSeats: 4, 
        numberOfBags: 2, 
        numberOfDoors: 4, 
        acMode: "Auto", 
        pricePerHour: 2.3,  
        discountPayNow: 0.1),
    Car(ID: 11,
        imageName: "kisspng_nissan_teana_jeep_icon", 
        type: "PREMIUM FULL-SIZE", 
        name: "Nissan Teana or Similar", 
        numberOfSeats: 5, 
        numberOfBags: 4, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 3.34,  
        discountPayNow: 0.24),
    Car(ID: 12,
        imageName: "Toyota_Mark_X_2nd_icon", 
        type: "ENTRY LUXURY", 
        name: "Toyota Mark X", 
        numberOfSeats: 5, 
        numberOfBags: 4, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 4.5, 
        discountPayNow: 0),
    Car(ID: 13,
        imageName: "2016_nissan_dualis_icon", 
        type: "SUV", 
        name: "Nissan Dualis or Similar", 
        numberOfSeats: 5, 
        numberOfBags: 4, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 3.71,  
        discountPayNow: 0.11),
    Car(ID: 14,
        imageName: "Nissan_Xtrail_icon", 
        type: "LARGE SUV- 7 SEATER", 
        name: "Nissan Xtrail or Similar", 
        numberOfSeats: 7, 
        numberOfBags: 5, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 4.5, 
        discountPayNow: 0.26),
    Car(ID: 15,
        imageName: "car_2017_bmw_x1_icon", 
        type: "LUXURY SUV", 
        name: "Audi Q3 or BMW X1 or Benz GLA-180", 
        numberOfSeats: 5, 
        numberOfBags: 4, 
        numberOfDoors: 4, 
        acMode: "automatic", 
        pricePerHour: 4.13,  
        discountPayNow: 0.01),
]
