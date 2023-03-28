//
//  CheckListView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//
import SwiftUI

// Die CheckListView-Struktur enthält eine @Binding-Variable, um den Status der Ansicht zu verfolgen
struct CheckListView: View {
    @Binding var CheckListViewIsShowing: Bool // Binding-Variable zum Verfolgen des Status der Ansicht
    
    var body: some View {
     
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.blue,.gray], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10.0){
                
                ScrollView{
                        
                    Text("Explore") // Ein Textelement wird angezeigt
                    
                    // Der Text erhält einige Formatierungen
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(Color.purple)
                    .padding(.leading)
                    
                    Spacer()
                    Spacer()
                    
                    // Ein Bild wird angezeigt und formatiert
                    Image("th")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width: Constants.General.imageWidth,   height: Constants.General.imageHeight)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("TitleBackgroundColor"), lineWidth: Constants.General.lineWidth))
                    
                    Spacer()
                    .padding()
                    
                    Divider() // Ein Trennelement wird hinzugefügt
                    
                    // Eine Reihe von MemberInfoView-Elementen wird in einer VStack platziert
                    VStack(alignment: .center, spacing: 20.0){
                        MemberInfoView(text: "Plan a trip with friends                     ", systemName: "checkmark.circle.fill")
                        MemberInfoView(text: "Choose Amazing Cities to Explore   ", systemName: "checkmark.circle.fill")
                        MemberInfoView(text: "Share the bills with your friends        ", systemName: "checkmark.circle.fill")
                        MemberInfoView(text: "Let us Reviews and Pictures              ", systemName: "checkmark.circle.fill")
                    }
                    
                    // Ein Schließen-Button wird hinzugefügt
                    Button(action: {
                        CheckListViewIsShowing = false // Wenn geklickt wird, wird der CheckListViewIsShowing-Status auf false gesetzt
                    }){
                        RoundViews(systemName: "xmark")
                    }.padding()

                }
            }
        }
    }
}

// Die Preview-Struktur zeigt zwei Versionen der CheckListView-Struktur an
struct CheckListView_Previews: PreviewProvider {
    
    // Die CheckListViewIsShowing-Variable wird initialisiert
    private static var CheckListViewIsShowing = Binding.constant(false)
    
    static var previews: some View {
        CheckListView(CheckListViewIsShowing: CheckListViewIsShowing) // Eine Instanz der CheckListView-Struktur wird angezeigt
        CheckListView(CheckListViewIsShowing: CheckListViewIsShowing)
            
    }
}

import SwiftUI

struct MemberInfoView: View {

    // Eigenschaften für den View
    let text : String
    let systemName : String
    
    var body: some View {
            
        // RoundedRectangle mit den Eigenschaften füllen und Größe festlegen
        RoundedRectangle(cornerRadius: Constants.General.roundedRectangleCornerRadius)
            .fill(Color("RoundedBackgroundColor-1"))
            .frame(width: Constants.General.roundedRectangleWidth, height: Constants.General.roundedRectangleHeight)
        
            // Text-Attribut für den Text-Stil definieren
            .font(.title)
            // HStack für das Icon und den Text einrichten
            .overlay(HStack{
                Image(systemName: systemName)
                    .foregroundColor(Color("FilledBackgroundColor"))
                Text(text)
                    .foregroundColor(Color("FilledBackgroundColor"))
                    
            })
        
    }
}

// Preview für den MemberInfoView definieren
struct MemberInfoView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview für den MemberInfoView mit Text und Icon
        MemberInfoView(text: "Hi", systemName: "list.bullet.indent")
        // Preview für den MemberInfoView mit Text und Icon
        MemberInfoView(text: "Hi", systemName: "list.bullet.indent")
            // Preview in Querformat darstellen
            .previewInterfaceOrientation(.landscapeRight)
    }
}


import SwiftUI

struct InfoView: View {

    
    let text : String
    let systemName : String
    
    var body: some View {
            
        RoundedRectangle(cornerRadius: Constants.General.roundedRectangleCornerRadius)
            .fill(Color("RoundedBackgroundColor-1"))
            .frame(width: Constants.General.roundedRectangleWidth, height: Constants.General.roundedRectangleHeight)
        
            .font(.title)
            .overlay(HStack{
                Image(systemName: systemName)
                    .foregroundColor(Color("FilledBackgroundColor"))
                Text(text)
                    .foregroundColor(Color("FilledBackgroundColor")
                    )
                    
            })
        
    }
}




struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hi", systemName: "list.bullet.indent")
        InfoView(text: "Hi", systemName: "list.bullet.indent")
            
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}

import SwiftUI

struct IconView: View {
    @Binding var IconViewIsShowing : Bool
    var body: some View {
        Text("Hello, World!")
    }
}

struct IconView_Previews: PreviewProvider {
    private static var IconViewIsShowing = Binding.constant(false)
    static var previews: some View {
        IconView(IconViewIsShowing: IconViewIsShowing)
    }
}
