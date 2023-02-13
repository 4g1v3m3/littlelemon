//
//  Menu.swift
//  Little Lemon
//
//  Created by Pavel Lebedev on 03.02.2023.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText: String = ""
    
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var dishes: FetchedResults<Dish>
    
    
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let menuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let menuURL = URL(string: menuAddress)!
        let request = URLRequest(url: menuURL)
        URLSession.shared.dataTask(with: request) { url, response, error in
            if let data = url,
               let fullMenu = try? JSONDecoder().decode(MenuList.self, from: data) {
                let menuItems = fullMenu.menu
                for menuItem in menuItems {
                    let dish = Dish(context: viewContext)
                    dish.title = menuItem.title
                    dish.price = menuItem.price
                    dish.image = menuItem.image
                }
                try? viewContext.save()
            } else {
                print("error")
            }
        }.resume()
    }
    
    var body: some View {
        VStack(){
            Text("Little Lemon Restaurant")
                .font(.title)
            Text("Chicago")
                .font(.title2)
            Text("This is our menu. Please be free to select anything!")
                .font(.title3)
                .padding(.top)
                List{
                    TextField("Seach here...", text: $searchText)
                    FetchedObjects(
                        predicate: buildPredicate(),
                        sortDescriptors: buildSortDescriptors()
                    ) { (dishes: [Dish]) in
                        ForEach(dishes) { dish in
                            HStack(){
                                Text("\(dish.title!) $\(dish.price!)")
                                let imageURL = URL(string: dish.image!)
                                Spacer()
                                AsyncImage(url: imageURL) { image in
                                    image.resizable() } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 75, height: 75)
                            }}
                    }
                    .padding(0)

                }
                .padding(.bottom, 20)
                .onAppear() {
                    getMenuData()
                }
            
        }
    }
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                ascending: true,
                                selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        return searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
