//
//  MemberDataSheet.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//

import SwiftUI

// Sheet zur Anzeige der Benutzerdaten
struct MemberDataSheet: View {
@Binding var isShowingMemberDataSheet: Bool
@ObservedObject var memberDataViewModel: MemberDataViewModel


var body: some View {
    NavigationView {
        List {
            // Anzeige aller gespeicherten Benutzerdaten
            ForEach(memberDataViewModel.savedUserDaten) { data in
                HStack {
                    Image(systemName: data.done ? "checkmark.circle.fill" : "checkmark.circle")
                    Text(data.desc ?? "No description")
                        .strikethrough(data.done)
                    Spacer()
                    Button(action: {
                        memberDataViewModel.updateMemberData(MemberData: data)
                    }) {
                        Text(data.done ? "Undo" : "Done")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
        }
        .navigationTitle("Member Data")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowingMemberDataSheet = false
                }) {
                    Text("Close")
                }
            }
        }
    }
}
}
