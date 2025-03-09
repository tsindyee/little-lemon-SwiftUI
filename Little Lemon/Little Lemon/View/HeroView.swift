//
//  HeroView.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-27.
//

import SwiftUI

struct HeroView: View {
    @State var searchHeroText = ""
    @State var showSearchBar = true
    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primaryColor2)
                    Text("Chicago")
                        .font(.title2)
                        .foregroundColor(.highlightColor1)
                    Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.body)
                        .foregroundColor(.highlightColor1)
                }
                Image("Hero image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
            .padding(.horizontal)
            if showSearchBar {
                TextField("Search", text: $searchHeroText)
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                    .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .background(Color.primaryColor1)
    }
}

#Preview {
    HeroView()
        .background(.primaryColor1)
}
