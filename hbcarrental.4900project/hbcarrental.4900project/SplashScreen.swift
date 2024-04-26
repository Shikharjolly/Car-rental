/*
SplashScreen.swift
hbcarrental.4900project
Created by Ayrat Aymetov 4/24/24.
*/

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                LandingPage()
            } else {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    Image("Hummingbird_rental_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
