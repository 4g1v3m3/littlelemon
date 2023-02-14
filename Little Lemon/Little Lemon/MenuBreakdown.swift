//
//  MenuBreakdown.swift
//  Little Lemon
//
//  Created by Pavel Lebedev on 14.02.2023.
//

import SwiftUI

struct MenuBreakdown: View {
    @State private var menuBreakdown = ["Starters", "Mains", "Desserts", "Drinks"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15){
                ForEach(0..<menuBreakdown.count, id: \.self) { number in
                    Button {
                        
                    } label: {
                        Text(menuBreakdown[number])
                            .font(.custom(.bodyExtra, size: 16))
                    }
                    .padding(10)
                    .foregroundColor( Color.primary)
                    .background(Color.secondaryColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .onTapGesture {
                        
                    }
                }
            }
        }
    }
}

struct MenuBreakdown_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdown()
    }
}
