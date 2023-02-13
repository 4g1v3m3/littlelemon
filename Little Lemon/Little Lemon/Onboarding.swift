//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Pavel Lebedev on 03.02.2023.
//

import SwiftUI
let kFirstName = "first name"
let kLastName = "last name"
let kEmail = "email"
let kIsLoggedIn = "kisloggedin"

struct Onboarding: View {
    @State var isLoggedIn = false
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var eMail: String = ""
    @State private var showingAlert = false
    var body: some View {
        NavigationView() {
            VStack(){
                NavigationLink(destination: Home(), isActive: $isLoggedIn)
                {
                          EmptyView()
                      }
                Text("Registration form:").font(.title2).padding()
                TextField("First Name", text: $firstName)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .padding(5)
                TextField("Last Name", text: $lastName)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .padding(5)
                TextField("Email", text: $eMail)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .padding(5)
                Button("Register")
                {
                    if !firstName.isEmpty && !lastName.isEmpty && eMail.contains("@") && eMail.contains("."){
                        print(isLoggedIn)
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(eMail, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                        print(isLoggedIn)
                        
                    } else {
                        print("Error")
                        print(isLoggedIn)
                        showingAlert = true
                    }
                }
                .controlSize(.large)
                .padding()
                .buttonStyle(.borderedProminent)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Wrong First Name, Last Name or E-Mail"), dismissButton: .default(Text("OK"))) }
            }
            .onAppear(){
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) != false {
                    isLoggedIn = true
                    
                }
            }
            .padding(50)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
