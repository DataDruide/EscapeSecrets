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
            
            Image("skizzeberg")
                .resizable()
                .scaledToFill()
                .overlay(Rectangle())
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.black.opacity(0.85))
                .contrast(0.7)
                .offset(x: -0)
                .opacity(01.05)
            ScrollView {
                
                VStack(alignment: .center, spacing: 16) {
                    Text("Profil")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    VStack(alignment: .leading, spacing: 16) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                                .frame(width: 370, height: 370) // hier die Breite reduzieren
                                .shadow(radius: 10)
                                .overlay(
                                    VStack(alignment: .center, spacing: 16) {
                                        Text("Personendaten")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                        Divider()
                                        HStack {
                                            Text("Vorname:")
                                                .foregroundColor(.black)
                                            TextField("Vorname", text: $firstNameText)
                                                .background(Color.gray.opacity(0.2))

                                        }
                                        HStack {
                                            Text("Nachname:")
                                                .foregroundColor(.black)
                                            TextField("Nachname", text: $lastNameText)
                                                .background(Color.gray.opacity(0.2))

                                        }
                                        HStack {
                                            Text("E-Mail:")
                                                .foregroundColor(.black)
                                            TextField("E-Mail", text: $emailText)
                                                .background(Color.gray.opacity(0.2))

                                        }
                                        HStack {
                                            Text("Alter:")
                                                .foregroundColor(.black)
                                            TextField("Alter", text: $ageText)
                                                .background(Color.gray.opacity(0.2))

                                        }
                                        HStack {
                                            Text("Telefonnummer:")
                                                .foregroundColor(.black)
                                            TextField("Telefonnummer", text: $phoneNumberText)
                                                .background(Color.gray.opacity(0.2))

                                        }
                                    }
                                    .padding([.leading, .trailing])
                                    .multilineTextAlignment(.center)
                                )
                        
                            RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.25))
                                .frame(width: 370, height: 370) // hier die Breite reduzieren
                                .shadow(radius: 14)
                                .overlay(
                                    VStack(alignment: .center, spacing: 10) {
                                        Text("Reiseinformationsdaten")
                                            .padding()
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                        VStack(alignment: .center, spacing: 10) {
                                            HStack {
                                                Text("Adresse:")
                                                    .foregroundColor(.black)
                                                TextField("Adresse", text: $addressText)
                                                    .background(Color.gray.opacity(0.2))

                                            }
                                            HStack {
                                                Text("Stadt:")
                                                    .foregroundColor(.black)
                                                TextField("Stadt", text: $cityText)
                                                    .background(Color.gray.opacity(0.2))

                                            }
                                            HStack {
                                                Text("Postleitzahl:")
                                                    .foregroundColor(.black)
                                                TextField("Postleitzahl", text: $zipCodeText)
                                                    .background(Color.gray.opacity(0.2))

                                            }
                                            HStack {
                                                Text("Land:")
                                                    .foregroundColor(.black)
                                                TextField("Land", text: $countryText)
                                                    .background(Color.gray.opacity(0.2))

                                            }
                                            HStack {
                                                Text("Passnummer:")
                                                    .foregroundColor(.black)
                                                TextField("Passnummer", text: $passportNumberText)
                                                    .background(Color.gray.opacity(0.2))

                                            }
                                            HStack {
                                                Text("Pass-Ablaufdatum:")
                                                    .foregroundColor(.black)
                                                TextField("Pass-Ablaufdatum", text: $passportExpirationDateText)
                                                    .background(Color.gray.opacity(0.2))

                                            }
                                        }
                                     //   Spacer()
                                        
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
                                                //.frame(height: 60)
                                                .frame(width: 200, height: 45)
                                                .background(Color.red.opacity(0.75))
                                                .cornerRadius(10)
                                                .padding(.horizontal, 20)
                                        }
                                    }.sheet(isPresented: $IconViewIsShowing) {
                                        // Anzeige des MemberData-Sheets
                                        IconView(IconViewIsShowing: $IconViewIsShowing, memberDataViewModel: memberDataViewModel)
                                            .padding()
                                    }.padding()
                                    

                                    
                              )}.multilineTextAlignment(.center)

                        Spacer()

                        }
                    }
                    
                }
            }
        }
    

//import SwiftUI
//
//extension Color {
//   static let graypurple = Color("graypurple")
//}



struct CreateProfilView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfilView()
    }
}
