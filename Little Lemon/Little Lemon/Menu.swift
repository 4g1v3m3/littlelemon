//
//  Menu.swift
//  Little Lemon
//
//  Created by Pavel Lebedev on 03.02.2023.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText: String = ""
    
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
        VStack(spacing: 0){
            LogoView()
                .padding(.bottom)
            HeroSection()
            VStack {
                TextField("Seach here...", text: $searchText)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .background(Color.primaryColor)
                    .padding()
            }
                .background(Color.primaryColor)
            MenuBreakdown()
                .padding()
                List{
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
