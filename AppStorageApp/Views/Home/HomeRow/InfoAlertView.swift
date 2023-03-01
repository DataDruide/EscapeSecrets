//
//  InfoAlertView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import SwiftUI

struct InfoAlertView: View {
    @State private var showAlert = false
    var body: some View {
        
            Button("Info") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("No destination has been selected yet"),
                    message: Text(", please select a destination here")
                )
            }.foregroundColor(.orange)
        }
}

struct InfoAlertView_Previews: PreviewProvider {
    static var previews: some View {
        InfoAlertView()
    }
}
