//
//  RegistrationView.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-28.
//

import SwiftUI

struct RegistrationView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isValid = false
    @State var showAlert = false
    @State var alertMessage = ""
    
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
            VStack(spacing: 16) {
                TextFieldGroup(title: "First Name", text: $firstName, placeholder: "Please enter your first name")
                TextFieldGroup(title: "Last Name", text: $lastName, placeholder: "Please enter your last name")
                TextFieldGroup(title: "Email", text: $email, placeholder: "Please enter your email")
                Spacer()
                Button("Next") {
                    if firstName.isEmpty ||
                        lastName.isEmpty ||
                        email.isEmpty {
                        alertMessage = "Please fill in all fields before proceeding"
                        showAlert = true
                    } else if !email.contains("@") || !email.contains(".") {
                        alertMessage = "Email format incorrect"
                        showAlert = true
                    } else {
                        isValid = true
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.secondaryColor1)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)

                NavigationLink(destination: ConfirmationView(firstName: firstName, lastName: lastName, email: email), isActive: $isValid) {
                    EmptyView()
                }
                .padding()
                .disabled(firstName.isEmpty || lastName.isEmpty || email.isEmpty)
                Spacer()
            }
            .padding()
            .alert("Missing Information", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct TextFieldGroup: View {
    let title: String
    @Binding var text: String
    let placeholder: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            TextField(placeholder, text: $text)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
        }
        .padding(.horizontal)
    }
}

#Preview {
    RegistrationView()
}
