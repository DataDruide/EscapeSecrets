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
    
    // Eingabevariablen für die Textfields
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
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    @State private var isShowingMemberDataSheet = false
    
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    VStack {
                        
                        // Personal Information
                        Group {
                            Text("Personal Informations")
                                .font(.custom("Helvetica", size: 24))
                                .foregroundColor(Color.black)
                                .padding()
                            
                            Text("Complete your travel profile here\nto book a trip. Our team wishes you a pleasant\nand enjoyable journey")
                                .font(.custom("Helvetica", size: 14))
                                .foregroundColor(Color.black).opacity(0.7)
                                .padding()
                                .multilineTextAlignment(.center)
                            
                            
                            TextField("First Name", text: $firstNameText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            TextField("Last Name", text: $lastNameText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            TextField("Email", text: $emailText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            TextField("Phone Number", text: $phoneNumberText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            TextField("Age", text: $ageText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                        }
                        
                    }
                    
                    // Address Information
                    Group {
                        Text("Address Informations")
                            .foregroundColor(Color.black)
                            .font(.custom("Helvetica", size: 20))
                            .padding()
                        
                        TextField("Address", text: $addressText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("City", text: $cityText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("Zip Code", text: $zipCodeText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("Country", text: $countryText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                    }
                    
                    
                    
                    // Passport Information
                    Group {
                        Text("Passport Informations")
                            .font(.custom("Helvetica", size: 16))
                            .foregroundColor(Color.black)
                            .padding()
                        
                        
                        TextField("Passport Number", text: $passportNumberText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("Passport Expiration Date", text: $passportExpirationDateText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                    }
                    
                    // Button zum Anzeigen des MemberData-Sheets
                    Button {
                        isShowingMemberDataSheet = true
                        
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
                        Text("Show Member Data Sheet")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 60)
                            .frame(width: 200, height: 55)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                }
                // Navigationstitel
                .navigationTitle("Member Data")
                .background(Image("Background_gradient"))
                .opacity(0.7)
            }
        }
        .sheet(isPresented: $isShowingMemberDataSheet) {
            // Anzeige des MemberData-Sheets
            MemberDataSheet(isShowingMemberDataSheet: $isShowingMemberDataSheet, memberDataViewModel: memberDataViewModel)
        }
    }
    
    
}
                   
                
