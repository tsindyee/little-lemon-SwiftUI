//
//  MenuBreakdownView.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-27.
//

import SwiftUI

struct MenuBreakdownView: View {
    var body: some View {
        VStack {
            Text("ORDER FOR DELIVERY!")
                .fontWeight(.bold)
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    Text("Starters")
                        .padding(12)
                        .background(.highlightColor1)
                        .cornerRadius(16)
                    Text("Mains")
                        .padding(12)
                        .background(.highlightColor1)
                        .cornerRadius(16)
                    Text("Desserts")
                        .padding(12)
                        .background(.highlightColor1)
                        .cornerRadius(16)
                    Text("Drink")
                        .padding(12)
                        .background(.highlightColor1)
                        .cornerRadius(16)
                }.padding()
            }
            
        }
    }
}

#Preview {
    MenuBreakdownView()
}
