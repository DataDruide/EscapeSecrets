//
//  NavigationBar.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 13.04.23.
//
import SwiftUI

struct NavigationBar: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                ForEach(0..<4, id: \.self) { item in
                    Button(action: {
                        // Do something here
                    }) {
                        VStack {
                            if item == 0 {
                                Image(systemName: "person.crop.circle")
                                    .imageScale(.small)
                                    .foregroundColor(Color.black)
                                Text("Profil")
                                    .foregroundColor(Color.black)
                            } else if item == 1 {
                                Image(systemName: "checkmark.circle")
                                    .imageScale(.small)
                                Text("Tickets")
                                    .foregroundColor(Color.black)
                            } else if item == 2 {
                                Image(systemName: "ticket")
                                    .imageScale(.small)
                                    .foregroundColor(Color.black)
                                Text("Tickets")
                                    .foregroundColor(Color.black)
                            } else if item == 3 {
                                Image(systemName: "cart")
                                    .imageScale(.small)
                                    .foregroundColor(Color.black)
                                Text("Shop")
                                    .foregroundColor(Color.black)

                            }
                        }
                    }
                }
            }
            .padding()
            Rectangle()
                .stroke(Color.white, lineWidth: 2)
                .background(Color.gray.opacity(0.33))
            .cornerRadius(5)
            .frame(width: 100, height: 280)
            .shadow(radius: 10)
            .blur(radius: 0.5)
            .toolbar {
                ToolbarItemGroup(placement: .navigation) {
                  Menu {
                      ForEach(0..<4, id: \.self) { item in
                               Button(action: {
                                   
                               }) {
                                Text("Menü")
                            }
                        }
                    } label: {
                        Image(systemName: "star")
                    }
                }
             }

        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
