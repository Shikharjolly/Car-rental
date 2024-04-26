/*
LandingPage.swift
hbcarrental.4900project
Created by Ayrat Aymetov 4/24/24.
*/

import SwiftUI

struct LandingPage: View {
    @EnvironmentObject var userAuth: UserAuth

    @State private var showText = false
    @State private var isVisible = true

    var body: some View {
        NavigationView {
            ZStack {
                Image("landing_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    if showText && isVisible {
                        VStack {
                            Text("SAVE")
                            Text("20% off")
                            Text("Pre-BOOK")
                            Text("RENTALS")
                        }
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .transition(.opacity)   
                    }
                }
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        self.userAuth.isLoggedin = true
                    }) {
                        Text("Continue as Guest")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 10)
                    
                    NavigationLink(destination: SignInView()) {
                        Text("  Sign In / Sign Up  ")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 50)
            }
            .onAppear {
                showHideText()
            }
        }
    }
    
    func showHideText() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.showText = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    self.isVisible = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isVisible = true
                    }
                    self.showHideText()
                }
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
