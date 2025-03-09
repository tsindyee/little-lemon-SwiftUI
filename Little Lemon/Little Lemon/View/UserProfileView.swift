//
//  UserProfileView.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-26.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.presentationMode) var presentation
    
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Personal Information")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            Image("profile-image-placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 5)
            VStack(alignment: .leading, spacing: 8) {
                Text("Name")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text("\(firstName) \(lastName)")
                    .font(.title2)
                    .fontWeight(.medium)
                Divider()
                Text("Email")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(email)
                    .font(.title2)
                    .fontWeight(.medium)
                Divider()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)

            Button(action: logout) {
                Text("Logout")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.secondaryColor1)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding()
    }
    
    private func logout() {
        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
        presentation.wrappedValue.dismiss()
    }
}


#Preview {
    UserProfileView()
}
