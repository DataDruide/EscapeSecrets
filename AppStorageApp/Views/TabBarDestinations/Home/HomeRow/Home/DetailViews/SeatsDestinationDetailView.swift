//
//  SeatsDestinationDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 03.04.23.
//

import SwiftUI

struct SeatsDestinationDetailView: View {
    var body: some View {
        NavigationStack {
            
            ZStack {
                LinearGradient(colors: [.black.opacity(0.97), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    ForEach(0..<1, id: \.self) { num in
                        VStack {
                            Image("sitzplatzsitz")
                                .resizable()
                            Text("")
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                            
                        }
                        
                    }
                }.navigationBarTitle("Seats", displayMode: .inline)
            }
        }
    }
    struct SeatsDestinationDetailView_Previews: PreviewProvider {
        static var previews: some View {
            SeatsDestinationDetailView()
        }
    }
}
