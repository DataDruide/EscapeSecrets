//
//  HotelListView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI


struct HotelListView: View {
    
    @StateObject var hotelType = HotelTypeViewModel()
    
    @Binding var HotelListViewisShowing : Bool
    
    // Suchtext für die Filterung der Hotels
    @State private var searchText = ""
    
    
    var body: some View {
        //  NavigationView {
        ZStack {
            
            Image("santorini")
                .resizable()
                .ignoresSafeArea(.all)
            
                        // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.black.opacity(0.97),.black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBarView2(searchTerm:  $searchText)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.75))
                
                List(hotelType.hotelsList.filter({ searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) }))  { hotel in
                    NavigationLink(destination: HotelDetailView(hotel: hotel)) {
                        HotelButton(name: hotel.name, image: hotel.image)
                            .padding(15)
                    }
                    .environmentObject(Cart())
                }
                .navigationBarTitle("Hotels")
                .cornerRadius(15)
                .padding(20)
                .searchable(text: $searchText, prompt: "find here your Secret Hotels...")
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.gray)
                .toolbar {
                    ToolbarItemGroup(placement: .automatic){
                        Button(action: { self.HotelListViewisShowing.toggle() }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
        }
    }
    
    struct HotelListView_Previews: PreviewProvider {
        private static var HotelListViewisShowing =
        Binding.constant(false)
        static var previews: some View {
            HotelListView(HotelListViewisShowing: .constant(true))
        }
    }
    
}
