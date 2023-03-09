//
//  ItemListView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//
//
//import SwiftUI
//
//struct ItemListView: View {
//    let name: String
//    let reiseImage: String
//
//    let imageDim: CGFloat = 70
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 5) {
//                Text(name)
//                    .foregroundColor(.orange)
//                    .font(.caption)
//                    .foregroundColor(.white)
//                    .fontWeight(.semibold)
//            }.padding()
//
//            Spacer()
//
//            Image(reiseImage)
//                .resizable()
//                .frame(width: imageDim, height: imageDim)
//                .cornerRadius(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.white, lineWidth: 1)
//                )
//                .shadow(color: .white.opacity(0.7), radius: 10, x: 0, y: 0)
//        }
//        .padding(.horizontal)
//            .background(Color.black.cornerRadius(10))
//
//    }
//}
//
//struct ItemListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemListView(name: "Deutschland",
//                     reiseImage: "brandenburger_tor")
//    }
//}
