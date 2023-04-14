//
//  IconView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 29.03.23.
//



import SwiftUI

struct IconView: View {
    @Binding var IconViewIsShowing : Bool
    @ObservedObject var memberDataViewModel: MemberDataViewModel
    
    @State private var showingImagePicker = false
        @State private var selectedImage: UIImage?
        

    var body: some View {
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.purple,.orange,.gray], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            // Hintergrundbildansicht
            Image("Strandbild")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
                Image("surfen")
                    .resizable()
                    .frame(width: 400, height: 250)
                
                NavigationView {
                    List {
                        // Anzeige aller gespeicherten Benutzerdaten
                        ForEach(memberDataViewModel.savedUserDaten) { data in
                            HStack {
                                Image(systemName: data.done ? "checkmark.circle.fill" : "checkmark.circle")
                                Text(data.desc ?? "No description")
                                    .strikethrough(data.done)
                                    .foregroundColor(.black)
                                Spacer()
                                Button(action: {
                                    memberDataViewModel.updateMemberData(MemberData: data)
                                }) {
                                    Text(data.done ? "Undo" : "Done")
                                        .foregroundColor(.black)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                    .navigationTitle("Member Data")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                IconViewIsShowing = false
                            }) {
                                Text("Close")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
            }.background(Color.black)
        }
    }
}

