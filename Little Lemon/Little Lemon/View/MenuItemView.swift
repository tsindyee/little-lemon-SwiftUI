//
//  MenuItemView.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-27.
//

import SwiftUI

struct MenuItemView: View {
    @ObservedObject var dish: Dish
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dish.title ?? "")
                    .font(.title3)
                    .fontWeight(.bold)
                Text(dish.desc ?? "")
                Text("$\(dish.price ?? "")")
                    .fontWeight(.bold)
            }
            Spacer()
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image.resizable() // Allows the image to be resized
                     .scaledToFit() // Maintains aspect ratio
            } placeholder: {
                ProgressView() // Show a loading indicator
            }
            .frame(height: 60) // Set fixed size
            .clipShape(RoundedRectangle(cornerRadius: 10)) // Optional: Add rounded corners
        }
        .padding()
    }
}

#Preview {
   let context = PersistenceController.shared.container.viewContext
   
   // Create a new Dish instance in a temporary context (not saved to Core Data)
   let dish = Dish(context: context)
   dish.title = "Hummus"
   dish.price = "10"
   dish.desc = "Some description"
   dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true" // Add a placeholder image

    return MenuItemView(dish: dish)

}
