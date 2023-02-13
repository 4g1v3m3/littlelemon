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
            Text("Personal information")
                .font(.title)
            Image("profile-image-placeholder")
                .resizable()
                .frame(maxWidth: 200, maxHeight: 200)
                .padding()
            Text(firstName)
            Text(lastName)
            Text(eMail)
            Button("Logout"){
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                print(Onboarding().isLoggedIn)
            self.presentation.wrappedValue.dismiss()
                
            }
            .controlSize(.large)
            .padding()
            .buttonStyle(.borderedProminent)
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
