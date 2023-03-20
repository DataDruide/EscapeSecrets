//
//  HeaderView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 20.03.23.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var search = ""
    
    var body: some View {
        ZStack {
            Shape1()

            Image("illustration")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .ignoresSafeArea(.all)
                .background(Color(#colorLiteral(red: 0.8370265722, green: 0.9096630931, blue: 0.1778520703, alpha: 1)))
                
                
            
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Capsule()
                                .frame(width: 22, height: 3)
                            
                            Capsule()
                                .frame(width: 22, height: 3)
                            
                            Capsule()
                                .frame(width: 14, height: 3)
                        }
                        .foregroundColor(Color(#colorLiteral(red: 0.04449907809, green: 0.04451666147, blue: 0.04449521869, alpha: 1)))
                    })
                    .padding(12)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    
                }
                .padding(.top)
           
            }
            .padding(.horizontal)
        }
        .frame(height: 170)
    }
}

struct MenuAndSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
