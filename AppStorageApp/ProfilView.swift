//
//  ProfilView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//


import SwiftUI

struct ProfilView: View {
    
    @State private var isAnimating = false

    
    // Properties for user input
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var zipCode: String = ""
    @State private var country: String = ""
    @State private var passportNumber: String = ""
    @State private var passportExpirationDate: String = ""
    @State private var travelDates: String = ""
    @State private var hotelName: String = ""
    @State private var hotelAddress: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // Personal Information
                    Group {
                        Text("Personal Information")
                            .font(.headline)
                            .foregroundColor(Color.orange)

                        TextField("First Name", text: $firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Last Name", text: $lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Phone Number", text: $phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // Address Information
                    Group {
                        Text("Address Information")
                            .foregroundColor(Color.orange)
                            .font(.headline)
                        TextField("Address", text: $address)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("City", text: $city)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Zip Code", text: $zipCode)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Country", text: $country)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // Passport Information
                    Group {
                        Text("Passport Information")
                            .font(.headline)
                            .foregroundColor(Color.orange)

                        TextField("Passport Number", text: $passportNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Passport Expiration Date", text: $passportExpirationDate)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // Travel Information
                    Group {
                        Text("Travel Information")
                            .font(.headline)
                            .foregroundColor(Color.orange)

                        TextField("Travel Dates", text: $travelDates)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Hotel Name", text: $hotelName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Hotel Address", text: $hotelAddress)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // Save Button
                    Button(action: {
                        // Save or update the user's data
                        withAnimation {
                            isAnimating = true
                        }
                    }) {
                        Text("Save")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(.spring())
                }
                .padding()
            }
        }
    }
}
