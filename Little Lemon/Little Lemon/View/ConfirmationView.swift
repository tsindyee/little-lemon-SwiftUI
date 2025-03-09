//
//  ConfirmationView.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-28.
//

import SwiftUI

struct ConfirmationView: View {
    let firstName: String
    let lastName: String
    let email: String
    
    @State private var isRegistered = false
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
            }
            HeroView(showSearchBar: false)
                .frame(maxWidth: .infinity)
                .background(Color.primaryColor1)

            VStack(alignment: .leading, spacing: 16) {
                Text("Please Confirm Your Information")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)

                Group {
                    Text("First Name: \(firstName)")
                    Text("Last Name: \(lastName)")
                    Text("Email: \(email)")
                }
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

                Button("Register / Login") {
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                    UserDefaults.standard.set(true, forKey: kIsLoggedIn)

                    isRegistered = true
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.secondaryColor1)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)

                Spacer()

                NavigationLink(destination: HomeView(), isActive: $isRegistered) {
                    EmptyView()
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    let firstName = "AAA"
    let lastName = "BBB"
    let email = "CCC@DDD.com"
    ConfirmationView(firstName: firstName, lastName: lastName, email: email)
}
