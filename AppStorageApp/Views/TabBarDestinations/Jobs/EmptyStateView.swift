//
//  EmptyStateView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 14.04.23.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.black,.black,.gray], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image(systemName: "graduationcap.circle")
                    .foregroundColor(.orange)
                    .font(.system(size: 85))
                    .padding(.bottom)
                Text("you are looking for a travel and work\n job then you are right here")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
            }
            .padding()
            .foregroundColor(Color(.white))
        }
    }
}
struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
