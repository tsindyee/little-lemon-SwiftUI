//
//  HomeView.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-26.
//

import SwiftUI

struct HomeView: View {
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        VStack {
            HStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Spacer()
                Image("profile-image-placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            .padding(.horizontal)
            .frame(height: 60)

            TabView {
                MenuView()
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)

                UserProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            .accentColor(.primaryColor1)
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.primaryColor1)
    }
}
#Preview {
    HomeView()
}
