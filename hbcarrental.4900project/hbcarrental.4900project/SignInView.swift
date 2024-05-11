//  SignInView.swift
// hbcarrental.4900project
// Created by Ayrat Aymetov 4/24/24.

import SwiftUI

struct SignInView: View {
    @State private var emailAddress = ""
    @State private var password = ""
    @State private var showingSignInAlert = false
    @State private var showingForgotPasswordAlert = false
    @State private var forgotPasswordEmail = ""
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        ZStack {
            Image("landing_image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Sign In")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    TextField("Username", text: $emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showingForgotPasswordAlert = true
                        }) {
                            Text("FORGOT PASSWORD?")
                                .font(.caption)
                                .scaleEffect(1.1)
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(20)
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                
                Button(action: {
                    if CustomerInformation.shared.userExists(emailAddress: emailAddress, password: password) {
                        self.userAuth.isLoggedin = true
                    } else {
                        self.showingSignInAlert = true
                    }
                }) {
                    Text("SIGN IN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(5)
                        .frame(maxWidth: .infinity)
                }
                .alert(isPresented: $showingSignInAlert) {
                    Alert(title: Text("Error"), message: Text("The information provided does not match our records. Please ensure that the information you have entered is correct and try again."), dismissButton: .default(Text("OK")))
                }
                .padding(.top, 10)

                NavigationLink(destination: SignUpView()) {
                    HStack {
                        Text("Need an account?")
                            .foregroundColor(.white)
                        Text("Sign up now")
                            .foregroundColor(.red)
                    }
                    .font(.caption)
                    .scaleEffect(1.5)
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 50)
            
            if showingForgotPasswordAlert {
                ForgotPasswordAlertView(isShowing: $showingForgotPasswordAlert, email: $forgotPasswordEmail)
            }
        }
    }
}

struct ForgotPasswordAlertView: View {
    @Binding var isShowing: Bool
    @Binding var email: String

    var body: some View {
        VStack {
            Text("Forgot your password?")
                .font(.headline)
            Text("Enter your email below. We'll send a link to reset it. Your security matters!")
                .font(.subheadline)
                .padding(.top, 10)
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
            Button(action: {
                // there is no code here yet
                self.isShowing = false
            }) {
                Text("Send")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(5)
            }
            .padding(.top, 10)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0, y: 5)
        .padding(.horizontal, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
    }
}
