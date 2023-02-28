//
//  CreateFlightPassView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct Settings {
    static let firstNameKey = "firstName"
    static let lastNameKey = "lastName"
    static let addresst = "address"
    static let zipCode = "zipCode"
    static let anzahlDerReisenden = "anzahlDerReisenden"
    static let childrens = "childrens"
    static let isSubscribedKey = "isSubscriper"

}


struct CreateFlightPassView: View {
    
    // Persönliche Daten
    @AppStorage(Settings.firstNameKey) var firstname = ""
    @AppStorage(Settings.lastNameKey) var lastname = ""
    // WohnOrt Daten
    @AppStorage(Settings.addresst) var address = ""
    @AppStorage(Settings.zipCode) var zipCode = ""
    // ReiseDaten Daten
    @AppStorage(Settings.anzahlDerReisenden) var anzahlDerReisenden = ""
    @AppStorage(Settings.childrens) var childrens = ""
    
    @AppStorage(Settings.isSubscribedKey) var isSubscriber = false



    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Persönliche Daten")){
                        
                        TextField("First Name", text: $firstname)
                        TextField("Last Name", text: $lastname)
                    }
                    
                    Section(header: Text("Wohnort Angaben")){
                        
                        TextField("Address", text: $address)
                        TextField("Zip Code", text: $zipCode)
                    }
                    
                    Section(header: Text("Reiseangaben")){
                        
                        TextField("Anz. Reisende", text: $anzahlDerReisenden)
                        TextField("Childrens", text: $childrens)
                    }
                    
                    Section(header: Text("Member Status")){
                        Toggle("isSubscriber", isOn: $isSubscriber)
                      
                    }
                }
            }
            .navigationTitle("AppSpeicher")
        }
    }
}

struct CreateFlightPassView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFlightPassView()
    }
}
