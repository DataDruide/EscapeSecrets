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
            
            Image("illustration")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .ignoresSafeArea(.all)
                .background(Color(#colorLiteral(red: 0.8370265722, green: 0.9096630931, blue: 0.1778520703, alpha: 1)))
            
            
            VStack(alignment: .leading) {
                HStack {
                       Shape1()
                        
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
