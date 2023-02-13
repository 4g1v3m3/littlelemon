//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Pavel Lebedev on 07.02.2023.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey { case
        title, price, image
    }
    
    var id = UUID()
    let title: String
    let price: String
    let image: String

}
