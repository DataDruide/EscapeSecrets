//
//  ProfileRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//



import SwiftUI

struct CreateProfilView: View {
    
    // Observable-Object-Klasse zur Verwaltung des App-Status
    @StateObject var memberDataViewModel = MemberDataViewModel()
    
    @State private var firstNameText: String = ""
    @State private var lastNameText: String = ""
    @State private var emailText: String = ""
    @State private var ageText: String = ""
    @State private var phoneNumberText: String = ""
    
    @State private var addressText: String = ""
    @State private var cityText: String = ""
    @State private var zipCodeText: String = ""
    @State private var countryText: String = ""
    @State private var passportNumberText: String = ""
    @State private var passportExpirationDateText: String = ""
    
    @State private var IconViewIsShowing = false
    
    var body: some View {
        ZStack {
            // Hintergrundbildansicht
            Color.black.opacity(0.75)
                .ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    Text("Profil")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    VStack(spacing: 20) {
                        Button(action: {}) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.beige)
                                .frame(width: 320, height: 300) // hier die Breite reduzieren
                                .shadow(radius: 10)
                                .overlay(
                                    VStack(alignment: .center) {
                                        Text("Personendaten")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Divider()
                                        HStack {
                                            Text("Vorname:")
                                                .foregroundColor(.gray)
                                            TextField("Vorname", text: $firstNameText)
                                        }
                                        HStack {
                                            Text("Nachname:")
                                                .foregroundColor(.gray)
                                            TextField("Nachname", text: $lastNameText)
                                        }
                                        HStack {
                                            Text("E-Mail:")
                                                .foregroundColor(.gray)
                                            TextField("E-Mail", text: $emailText)
                                        }
                                        HStack {
                                            Text("Alter:")
                                                .foregroundColor(.gray)
                                            TextField("Alter", text: $ageText)
                                        }
                                        HStack {
                                            Text("Telefonnummer:")
                                                .foregroundColor(.gray)
                                            TextField("Telefonnummer", text: $phoneNumberText)
                                        }
                                    }
                                    .padding([.leading, .trailing])
                                    .multilineTextAlignment(.center)
                                )
                        }
                        Button(action: {}) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.beige)
                                .frame(width: 320, height: 320) // hier die Breite reduzieren
                                .shadow(radius: 14)
                                .overlay(
                                    VStack(alignment: .center) {
                                        Text("Reiseinformationsdaten")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Divider()
                                        HStack {
                                            Text("Adresse:")
                                                .foregroundColor(.gray)
                                            TextField("Adresse", text: $addressText)
                                        }
                                        HStack {
                                            Text("Stadt:")
                                                .foregroundColor(.gray)
                                            TextField("Stadt", text: $cityText)
                                        }
                                        HStack {
                                            Text("Postleitzahl:")
                                                .foregroundColor(.gray)
                                            TextField("Postleitzahl", text: $zipCodeText)
                                        }
                                        HStack {
                                            Text("Land:")
                                                .foregroundColor(.gray)
                                            TextField("Land", text: $countryText)
                                        }
                                        HStack {
                                            Text("Passnummer:")
                                                .foregroundColor(.gray)
                                            TextField("Passnummer", text: $passportNumberText)
                                        }
                                        HStack {
                                            Text("Pass-Ablaufdatum:")
                                                .foregroundColor(.gray)
                                            TextField("Pass-Ablaufdatum", text: $passportExpirationDateText)
                                        }
                                        HStack {
                                            Spacer()
                                            
                                            Button {
                                                IconViewIsShowing = true
                                                
                                                // Überprüfung, ob alle Felder ausgefüllt wurden
                                                guard !firstNameText.isEmpty, !lastNameText.isEmpty, !emailText.isEmpty, !ageText.isEmpty, !phoneNumberText.isEmpty, !addressText.isEmpty, !cityText.isEmpty, !zipCodeText.isEmpty, !countryText.isEmpty else { return }
                                                // Aufruf der addNewMember-Funktion des ViewModel, um ein neues Profil hinzuzufügen
                                                memberDataViewModel.addNewMember("\(firstNameText) \(lastNameText), \(ageText), \(emailText), \(phoneNumberText), \(addressText), \(cityText), \(zipCodeText), \(countryText)")
                                                // Zurücksetzen der Eingabefelder
                                                firstNameText = ""
                                                lastNameText = ""
                                                emailText = ""
                                                ageText = ""
                                                phoneNumberText = ""
                                                addressText = ""
                                                cityText = ""
                                                zipCodeText = ""
                                                countryText = ""
                                                passportNumberText = ""
                                                passportExpirationDateText = ""
                                            } label: {
                                                Text("Complete User Profil ")
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                    .frame(height: 60)
                                                    .frame(width: 200, height: 55)
                                                    .background(Color.orange)
                                                    .cornerRadius(10)
                                                    .padding(.horizontal, 20)
                                            }
                                        }.sheet(isPresented: $IconViewIsShowing) {
                                            // Anzeige des MemberData-Sheets
                                            IconView(IconViewIsShowing: $IconViewIsShowing, memberDataViewModel: memberDataViewModel)
                                            Spacer()
                                        }
                                    }
                                    
                              )}.multilineTextAlignment(.center)

                            
                        }
                    }
                    
                }
            }
        }
    }

import SwiftUI

extension Color {
   static let beige = Color("beige")
}
