//
//  InfoView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 29.03.23.
//
//
//import SwiftUI
//
//struct InfoView: View {
//
//
//    let text : String
//    let systemName : String
//
//    var body: some View {
//
//        RoundedRectangle(cornerRadius: Constants.General.roundedRectangleCornerRadius)
//            .fill(Color(.orange))
//            .frame(width: Constants.General.roundedRectangleWidth, height: Constants.General.roundedRectangleHeight)
//
//            .font(.title)
//            .overlay(HStack{
//                Image(systemName: "person.crop.circle")
//                    .foregroundColor(Color(.white))
//                Text(text)
//                    .foregroundColor(Color(.black))
//
//
//            })
//
//    }
//}
//
//
//
//
//struct InfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoView(text: "Hi", systemName: "person.crop.circle")
//        InfoView(text: "Hi", systemName: "person.crop.circle")
//
//
//    }
//}
