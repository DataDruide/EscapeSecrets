//
//  PlanActivityTripView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI

struct PlanActivityTripView: View {
    
    // Zustandsobjekt für den TripType
    @StateObject var tripType = TripTypeViewModel()
    
    // Suchtext für die Filterung der Aktivitäten
    @State private var searchText = ""
        
    var filteredMessages: [Activities] {
        if searchText.isEmpty {
            return activities
        } else {
            return activities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
        
    var body: some View {
        
        NavigationView {
              
            ZStack{
                    
                VStack(alignment: .center){
                    
                    // Grid für die Anordnung der ActivityButtons
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(minimum: 100, maximum: 260)),
                            GridItem(.flexible(minimum: 100, maximum: 260))
                        ], spacing: 30
                    ) {
                        ForEach(filteredMessages, id: \.id) { activity in
                            NavigationLink(destination: DetailActivityView(activity: activity)) {
                                // ActivityButton für die Anzeige der Aktivität
                                ActivityButton(name: activity.name, image: activity.image)
                                    .padding(35)
                            }
                        }
                    }
                    .navigationBarTitle("Our Activity Program")
                }
                
            }.accentColor(.black)
                .background(Image("BG").opacity(0.4))
            
        }
        // Suchleiste für die Filterung der Aktivitäten
        .searchable(text: $searchText, prompt: "type something here...")
    }
}


struct PlanActivityTripView_Previews: PreviewProvider {
    // Vorschau mit einem TripType-Objekt
    private static var PlanActivityTripViewIsShowing = Binding.constant(false)
    static var previews: some View {
        PlanActivityTripView()
            .environmentObject(TripTypeViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}
