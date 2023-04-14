//
//  PlanActivityTripView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI

struct ActivityTripView: View {
    
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
        
        NavigationStack {
              
            ZStack {
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.black.opacity(0.97),.black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                  
                VStack(alignment: .center){
                    
                    Text("Our Event Program")
                        .foregroundColor(.orange)
                        .padding()
                        .font(.system(size: 34))
                        .bold()

                    
                    
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
                            }
                            .padding()
                        }

                    }

                }
                
                
            }
        }
        // Suchleiste für die Filterung der Aktivitäten
        .searchable(text: $searchText, prompt: "find here your perfect Event...")
    }
}


struct ActivityTripView_Previews: PreviewProvider {
    // Vorschau mit einem TripType-Objekt
    private static var ActivityTripViewIsShowing = Binding.constant(false)
    static var previews: some View {
        ActivityTripView()
            .environmentObject(TripTypeViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}
