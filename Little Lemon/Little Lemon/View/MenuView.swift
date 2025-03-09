//
//  MenuView.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-26.
//

import SwiftUI
import CoreData

struct MenuView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    var body: some View {
        VStack {
            HeroView()
                .background(.primaryColor1)
            MenuBreakdownView()
            TextField("Search Menu", text: $searchText)
                .padding(.horizontal)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        MenuItemView(dish: dish)
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(PlainListStyle())
            }
            
        }.onAppear {
             getMenuData()
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    let menuList = try? JSONDecoder().decode(MenuList.self, from: data)
                    if let menuItems = menuList?.menu {
                        menuItems.forEach { item in
                            if !checkExistingItem(item: item, context: viewContext) {
                                let dish = Dish(context: viewContext)
                                dish.title = item.title
                                dish.price = item.price
                                dish.desc = item.description
                                dish.id = Int32(item.id)
                                dish.category = item.category
                                dish.image = item.image
                            }
                        }
                        try? viewContext.save()
                    }
                }
            }
            task.resume()
        }
    }
    
    func checkExistingItem(item: MenuItem, context:NSManagedObjectContext) -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dish")
        fetchRequest.predicate = NSPredicate(format: "title == %@", item.title)
        
        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                    ascending: true,
                     selector:
                        #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        }
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        return predicate
    }
}

#Preview {
    MenuView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
