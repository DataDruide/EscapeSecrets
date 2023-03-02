//
//  FormField.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import SwiftUI

struct FormField: View {
    @State var text = ""
    var image: String
    var placeholder: String
    var isSecure: Bool
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.system(size: 21))
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(.leading, 8)
                    .textFieldStyle(.plain)

            } else {
                TextField(placeholder, text: $text)
                    .padding(.leading, 8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .textFieldStyle(.plain)

            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.black).opacity(0.2)
        )
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        FormField(image: "envelope", placeholder: "Email", isSecure: false)
    }
}
