//  SignUpView.swift
//  hbcarrental.4900project

import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""
    @State private var password = ""
    @State private var showingSignInView = false
    @State private var navigateToSignInView = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: SignInView()) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .font(.title)
                            .padding(.leading, 20)
                    }
                    Text("Create an Account")
                        .padding(.leading, 25)
                        .font(.title)
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .padding(.bottom, 10)

                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Join Hummingbird Car Rental in Jamaica")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding(.bottom, 10)

                        Text("Let's get your personal account setup.")
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)

                        TextField("First Name", text: $firstName)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)

                        TextField("Last Name", text: $lastName)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)

                        TextField("Email Address", text: $emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)

                        Text("Use E-mail Address as Username")
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)

                        SecureField("Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color.white)
                            .shadow(color: .gray, radius: 2, x: 2, y: 2)
                            .padding(.bottom, 10)

                        Button(action: {
                            let user = User(firstName: firstName, lastName: lastName, emailAddress: emailAddress, password: password)
                            CustomerInformation.shared.addUser(user: user)
                            self.navigateToSignInView = true
                        }) {
                            Text("CONTINUE")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.top, 20)
                        NavigationLink(destination: SignInView(), isActive: $navigateToSignInView) {
                            EmptyView()
                        }
                    }
                    .padding(20)
                }
                .background(Color(.gray).opacity(0.1))
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
