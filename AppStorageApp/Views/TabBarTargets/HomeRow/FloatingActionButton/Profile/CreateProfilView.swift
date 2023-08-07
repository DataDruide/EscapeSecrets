

import SwiftUI

struct CreateProfilView: View {
    
    // Observable-Object-Klasse zur Verwaltung des App-Status
    @StateObject var memberDataViewModel = MemberDataViewModel()
    
    // Variablen wo wir halten wollen den Wert
    
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
    
    @State private var CreatedMemberViewIsShowing = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            Image("skizzeberg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .contrast(0.9)
//                .offset(x: -0)
                .opacity(0.05)
            
            // ScrollView mit Texteingabefeldern
            
            ScrollView {
                VStack {
                    VStack(alignment: .center, spacing: 0) {
                        Text("Create a Profile")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                            .padding(.top, 10)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                                .frame(width: 370, height: 270) // hier die Breite reduzieren
                                .shadow(radius: 10)
                                .overlay(
                                    VStack(alignment: .center, spacing: 16) {
                                        Text("Person Data")
                                            .fontWeight(.bold)
                                            .foregroundColor(.yellow)
                                            .multilineTextAlignment(.center)
                                        Divider()
                                        HStack {
                                            Text("Firstname:")
                                                .foregroundColor(.black)
                                            TextField("Firstname", text: $firstNameText)
                                                .background(Color.gray.opacity(0.2))
                                            
                                        }
                                        .onTapGesture {
                                            // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                        }
                                        HStack {
                                            Text("LastName:")
                                                .foregroundColor(.black)
                                            TextField("LastName", text: $lastNameText)
                                                .background(Color.gray.opacity(0.2))
                                            
                                        }
                                        .onTapGesture {
                                            // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                        }
                                        
                                        HStack {
                                            Text("E-Mail:")
                                                .foregroundColor(.black)
                                            TextField("E-Mail", text: $emailText)
                                                .background(Color.gray.opacity(0.2))
                                            
                                        }
                                        .onTapGesture {
                                            // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                        }
                                        HStack {
                                            Text("Age:")
                                                .foregroundColor(.black)
                                            TextField("Age", text: $ageText)
                                                .background(Color.gray.opacity(0.2))
                                            
                                        }
                                        .onTapGesture {
                                            // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                        }
                                        HStack {
                                            Text("Phone Number:")
                                                .foregroundColor(.black)
                                            TextField("Phone Number", text: $phoneNumberText)
                                                .background(Color.gray.opacity(0.2))
                                        }
                                        .onTapGesture {
                                            // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
                                    VStack(alignment: .center, spacing: 0) {
                                        Text("Holiday Data")
                                            .padding()
                                            .fontWeight(.bold)
                                            .foregroundColor(.yellow)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                        VStack(alignment: .center, spacing: 0) {
                                            HStack {
                                                Text("Address:")
                                                    .foregroundColor(.black)
                                                TextField("Address", text: $addressText)
                                                    .background(Color.gray.opacity(0.2))
                                                
                                            }
                                            .onTapGesture {
                                                // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                            
                                            HStack {
                                                Text("City:")
                                                    .foregroundColor(.black)
                                                TextField("City", text: $cityText)
                                                    .background(Color.gray.opacity(0.2))
                                                
                                            }
                                            .onTapGesture {
                                                // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                            
                                            HStack {
                                                Text("Zip Code:")
                                                    .foregroundColor(.black)
                                                TextField("Zip Code", text: $zipCodeText)
                                                    .background(Color.gray.opacity(0.2))
                                                
                                            }
                                            .onTapGesture {
                                                // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                            
                                            HStack {
                                                Text("Country:")
                                                    .foregroundColor(.black)
                                                TextField("Country", text: $countryText)
                                                    .background(Color.gray.opacity(0.2))
                                                
                                            }
                                            .onTapGesture {
                                                // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                            
                                            HStack {
                                                Text("Passport Number:")
                                                    .foregroundColor(.black)
                                                TextField("Passport Number", text: $passportNumberText)
                                                    .background(Color.gray.opacity(0.2))
                                                
                                            }
                                            .onTapGesture {
                                                // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                            
                                            HStack {
                                                Text("Passport-EndDate:")
                                                    .foregroundColor(.black)
                                                TextField("Passport-EndDate", text: $passportExpirationDateText)
                                                    .background(Color.gray.opacity(0.3))
                                                
                                            }
                                            .onTapGesture {
                                                // Den Fokus vom aktuellen Textfeld entfernen, um die Tastatur auszublenden
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                        .padding()
                                        
                                        Button {
                                            CreatedMemberViewIsShowing = true
                                            
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
                                                .frame(width: 200, height: 35)
                                                .background(Color(
                                                    red: 75 / 255,
                                                    green: 115 / 255,
                                                    blue: 115 / 255
                                                ))
                                                .cornerRadius(10)
                                               // .padding(.horizontal, 20)
                                        }
                                       

                                    }.sheet(isPresented: $CreatedMemberViewIsShowing) {
                                        // Anzeige des MemberData-Sheets
                                        CreatedMemberView(CreatedMemberViewIsShowing: $CreatedMemberViewIsShowing, memberDataViewModel: memberDataViewModel)
                                            .padding()
                                    }.padding()
                                    
                                    
                                    
                                )}.multilineTextAlignment(.center)
                        
                        Spacer()
                        
                    }
                }
                
            }
        }
    }
}
struct CreateProfilView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfilView()
    }
}
