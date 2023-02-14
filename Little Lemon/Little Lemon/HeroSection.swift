//
//  HeroSection.swift
//  Little Lemon
//
//  Created by Pavel Lebedev on 14.02.2023.
//

import SwiftUI

struct HeroSection: View {
    
    var body: some View {
        VStack(spacing: 0){
            Text("Little Lemon")
                .font(.custom(.headMedium, size: 64))
                .foregroundColor(.secondaryColor)
                .padding(0)
                .padding(.leading, 5)
            
            HStack () {
                VStack(alignment: .leading){
                    Text("Chicago")
                        .font(.custom(.headMedium, size: 44))
                        .padding(0)
                        .padding(.leading, 5)
                        .foregroundColor(.highlightColor)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .foregroundColor(.highlightColor)
                        .font(.custom(.bodyMedium, size: 20))
                        .padding(0)
                        .padding(.leading, 5)
                }
                
                Image("Hero image")
                    .resizable()
                    .cornerRadius(24)
                    .frame(width: 110, height: 130)
            }
            .padding(.top, -10)
        }
        .frame(maxWidth: .infinity)
        .background(Color.primaryColor)
    }
}

struct HeroSection_Previews: PreviewProvider {
    static var previews: some View {
        HeroSection()
    }
}
