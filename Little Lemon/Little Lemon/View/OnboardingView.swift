//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-26.
//

import SwiftUI

let kFirstName = "firstNameKey"
let kLastName = "lastNameKey"
let kEmail = "emailKey"
let kIsLoggedIn = "kIsLoggedIn"

struct OnboardingView: View {
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                .hidden()

                HStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                }
                HeroView(showSearchBar: false)
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryColor1)

                Text("Welcome to Little Lemon!")
                    .font(.title2)
                    .padding(.top)
                Text("Start order by registering an account")
                    .foregroundColor(.secondary)

                NavigationLink(destination: RegistrationView()) {
                    Text("Register / Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.secondaryColor1)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

            }
            .onAppear {
                isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

#Preview {
    OnboardingView()
}
