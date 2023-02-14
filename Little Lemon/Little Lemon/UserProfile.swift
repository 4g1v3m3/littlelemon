//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Pavel Lebedev on 03.02.2023.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.value(forKey: kFirstName) as! String
    let lastName = UserDefaults.standard.value(forKey: kLastName) as! String
    let eMail = UserDefaults.standard.value(forKey: kEmail) as! String
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack(){
            LogoView()
            Text("Personal information")
                .font(.custom(.headMedium, size: 40))
            Image("profile-image-placeholder")
                .resizable()
                .frame(maxWidth: 200, maxHeight: 200)
                .padding()
            Text(firstName).padding(0).font(.custom(.bodyRegular, size: 20))
            Text(lastName).padding(0).font(.custom(.bodyRegular, size: 20))
            Text(eMail).padding(0).font(.custom(.bodyRegular, size: 20))
            Spacer()
            Button("Logout"){
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                print(Onboarding().isLoggedIn)
            self.presentation.wrappedValue.dismiss()
                
            }
            .frame(maxWidth: .infinity)
            .font(.custom(.bodyMedium, size: 32))
            .padding(10)
            .foregroundColor( Color.primary)
            .background(Color.secondaryColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        } .padding()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
