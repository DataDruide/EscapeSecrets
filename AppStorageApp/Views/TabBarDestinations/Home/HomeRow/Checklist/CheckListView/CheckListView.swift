//
//  CheckListView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//
import SwiftUI

// hier wird eine Checkliste angelegt

struct CheckListView: View {
    @Binding var CheckListViewIsShowing: Bool //
    
    var body: some View {
        
        ZStack {
         
            LinearGradient(colors: [.black.opacity(0.97),.black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
       
            VStack(alignment: .center){
              
                Text("Create\nChecklist") // Ein Textelement wird angezeigt
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(Color.orange)

                // Der Text erhält einige Formatierungen
                    .bold()
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color.white)
                
                    
                    Image("bannercheckliste")
                                .resizable()
                                .frame(width: 300,   height: 190)
                                .ignoresSafeArea(.all)
                                .padding()
                               
                 
                    Divider()
                
                    VStack(){
                        MemberInfoView(text: "Create a Boardingpass", systemName: "checkmark.circle.fill")
                        MemberInfoView(text: "Choose Amazing Flight   ", systemName: "checkmark.circle.fill")
                        MemberInfoView(text: "Choose a beatiful Hotel", systemName: "checkmark.circle.fill")
                        MemberInfoView(text: "You can book a trip everyday", systemName: "checkmark.circle.fill")
                        MemberInfoView(text: "You can choose a minijob when you become problems", systemName: "checkmark.circle.fill")
                    }
                    .padding()
                    
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



// Die Preview-Struktur zeigt zwei Versionen der CheckListView-Struktur an
struct CheckListView_Previews: PreviewProvider {
    
    // Die CheckListViewIsShowing-Variable wird initialisiert
    private static var CheckListViewIsShowing = Binding.constant(false)
    
    static var previews: some View {
        CheckListView(CheckListViewIsShowing: CheckListViewIsShowing) // Eine Instanz der CheckListView-Struktur wird angezeigt
       
    }
}

