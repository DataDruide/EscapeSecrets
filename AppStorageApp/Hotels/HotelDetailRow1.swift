//
//  HotelDetailRow1.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 09.03.23.
//
//import SwiftUI
//import MapKit
//
//struct HotelDetailRow1: View {
//    
//        @State private var showAlert = false
//        @EnvironmentObject var viewModel: ReiseAuswahlViewModel
//        
//        @State private var showingFeedbackSheet = false
//        @State private var feedbackTitle = ""
//        @State private var feedbackText = ""
//        @State private var offsetY: CGFloat = 0.0
//    
//    var body: some View {
//        
//        ZStack{
//            Image("Rome")
//                .resizable()
//                .frame(maxHeight: .infinity)
//                .clipped()
//                .ignoresSafeArea()
//            
//            Image("schild")
//                .resizable()
//                .frame(width: 290, height: 65)
//                .position(x: 200, y:180)
//        }
//        VStack{
//            HStack(spacing: 10) {
//                Spacer()
//                
//                Image(systemName: "wifi")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//                
//                Image(systemName: "sun.max")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//                
//                Image(systemName: "cross.case")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//                
//                Image(systemName: "cart.fill")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//            }
//            Spacer()
//            // Price for one week
//            HStack {
//                Spacer(minLength: 60)
//                
//                Text("$499")
//                    .foregroundColor(.yellow)
//                    .font(.system(size: 28))
//                
//                Spacer()
//                
//                Text("Price/week")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 24))
//                Spacer()
//                
//            }
//            .padding(.bottom)
//            
//            VStack {
//                Text("Health")
//                    .fontWeight(.semibold)
//                    .foregroundColor(.orange)
//                    .font(.title)
//                Text("10 Minutes to next CITY Hospital")
//                    .font(.subheadline)
//
//            }
//            
//            HStack(spacing: 20) {
//            VStack{
//                Button(action: {
//                                showingFeedbackSheet.toggle()
//                            }) {
//                                Text("Feedback geben")
//                            }
//                        }
//                        .sheet(isPresented: $showingFeedbackSheet) {
//                            VStack {
//                                Text("Feedback geben")
//                                    .font(.title)
//                                    .foregroundColor(.orange)
//                                    .padding()
//                                
//                                Image("applogo")
//                                    .resizable()
//                                    .frame(width: 375, height: 175)
//                                    .padding()
//                                
//                                Text("Helfen Sie uns unseren Service\n stetig zu verbessern")
//                                    .font(.title3)
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(.white)
//                                    .padding()
//                                
//                                TextField("Titel", text: $feedbackTitle)
//                                    .padding()
//                                    .background(.gray).opacity(0.55)
//                                    .cornerRadius(25)
//
//                                
//                                TextField("Feedback-Text", text: $feedbackText)
//                                    .padding()
//                                    .background(.gray).opacity(0.55)
//                                    .cornerRadius(25)
//
//                                
//                                Button(action: {
//                                    viewModel.addFeedback(title: feedbackTitle, text: feedbackText)
//                                    feedbackTitle = ""
//                                    feedbackText = ""
//                                    showingFeedbackSheet = false
//                                }) {
//                                    Text("Hinzufügen")
//                                        .foregroundColor(.white)
//                                        .background(.orange)
//                                        .frame(width: 200, height: 50)
//                                        .padding()
//                                }
//                                
//                                List(viewModel.feedbackList) { feedback in
//                                    VStack(alignment: .leading) {
//                                        Text(feedback.title)
//                                            .font(.headline)
//                                        
//                                        Text(feedback.text)
//                                            .font(.body)
//                                            .foregroundColor(.gray)
//                                    }
//                                    .padding(.vertical)
//                                }
//                                
//                                Spacer()
//                            }
//                            .padding()
//                        }
//                    }
//                
//                Spacer()
//                
//                Button("Covid19 Rules") {
//                    showAlert = true
//                }
//                .alert(isPresented: $showAlert) {
//                    Alert(
//                        title: Text("Here can see the\nactuality Covid19 Rules"),
//                        message: Text("That you can also react faster as a student or even as a traveler. What the epidemic taught us")
//                    )
//                    
//                }
//                .foregroundColor(.red)
//                .background(.orange)
//                Spacer()
//                
//            }
//        ScrollView {
//            // Show Map
//            Button(action: {
//                let coordinate = CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964)
//                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
//                mapItem.name = "Rom"
//                mapItem.openInMaps(launchOptions: nil)
//            }) {
//                Image("Map1")
//                    .resizable()
//                    .padding()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .cornerRadius(15)
//            }
//                    VStack {
//                        Text("Eines der berühmtesten Wahrzeichen Roms ist zweifellos das Kolosseum. Dieses Amphitheater aus dem 1. Jahrhundert n. Chr. wurde für Gladiatorenkämpfe und andere öffentliche Veranstaltungen genutzt und ist heute eine der meistbesuchten Sehenswürdigkeiten der Stadt.")
//                            .padding()
//                            .foregroundColor(.gray)
//                            .fontWeight(.thin)
//                        
//                        Text("Ein weiteres beeindruckendes Bauwerk in Rom ist der Petersdom, der im Vatikanstaat liegt. Dieser imposante Kirchenbau ist eine der größten Kirchen der Welt und beherbergt zahlreiche Kunstwerke, darunter Michelangelos berühmte Pietà.")
//                            .padding()
//                            .foregroundColor(.gray)
//                            .fontWeight(.thin)
//                        
//                        Button("Buchen"){}
//                            .foregroundColor(.orange)
//                            .fontWeight(.bold)
//                        
//                    }
//                }
//            }
//        }
//    
//
//import SwiftUI
//import MapKit
//
//struct HotelDetailRow2: View {
//    
//        @State private var showAlert = false
//        @EnvironmentObject var viewModel: ReiseAuswahlViewModel
//        
//        @State private var showingFeedbackSheet = false
//        @State private var feedbackTitle = ""
//        @State private var feedbackText = ""
//        @State private var offsetY: CGFloat = 0.0
//    
//    var body: some View {
//        
//        ZStack{
//            Image("berge")
//                .resizable()
//                .frame(maxHeight: .infinity)
//                .clipped()
//                .ignoresSafeArea()
//            
//            Image("schild")
//                .resizable()
//                .frame(width: 290, height: 65)
//                .position(x: 200, y:180)
//        }
//        VStack{
//            HStack(spacing: 10) {
//                Spacer()
//                
//                Image(systemName: "wifi")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//                
//                Image(systemName: "sun.max")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//                
//                Image(systemName: "cross.case")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//                
//                Image(systemName: "cart.fill")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//            }
//            Spacer()
//            // Price for one week
//            HStack {
//                Spacer(minLength: 60)
//                
//                Text("$499")
//                    .foregroundColor(.yellow)
//                    .font(.system(size: 28))
//                
//                Spacer()
//                
//                Text("Price/week")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 24))
//                Spacer()
//                
//            }
//            .padding(.bottom)
//            
//            VStack {
//                Text("Shops")
//                    .fontWeight(.semibold)
//                    .foregroundColor(.orange)
//                    .font(.title)
//                Text("2 min to the city")
//                    .font(.subheadline)
//                
//                Text("Eifelturm")
//                    .fontWeight(.semibold)
//                    .foregroundColor(.orange)
//                    .font(.title)
//                Text("10 min with the Bus")
//                    .font(.subheadline)
//
//            }
//            
//            HStack(spacing: 20) {
//            VStack{
//                Button(action: {
//                                showingFeedbackSheet.toggle()
//                            }) {
//                                Text("Feedback geben")
//                            }
//                        }
//                        .sheet(isPresented: $showingFeedbackSheet) {
//                            VStack {
//                                Text("Feedback geben")
//                                    .font(.title)
//                                    .foregroundColor(.orange)
//                                    .padding()
//                                
//                                Image("applogo")
//                                    .resizable()
//                                    .frame(width: 375, height: 175)
//                                    .padding()
//                                
//                                Text("Helfen Sie uns unseren Service\n stetig zu verbessern")
//                                    .font(.title3)
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(.white)
//                                    .padding()
//                                
//                                TextField("Titel", text: $feedbackTitle)
//                                    .padding()
//                                    .background(.gray).opacity(0.55)
//                                    .cornerRadius(25)
//
//                                
//                                TextField("Feedback-Text", text: $feedbackText)
//                                    .padding()
//                                    .background(.gray).opacity(0.55)
//                                    .cornerRadius(25)
//
//                                
//                                Button(action: {
//                                    viewModel.addFeedback(title: feedbackTitle, text: feedbackText)
//                                    feedbackTitle = ""
//                                    feedbackText = ""
//                                    showingFeedbackSheet = false
//                                }) {
//                                    Text("Hinzufügen")
//                                        .foregroundColor(.white)
//                                        .background(.orange)
//                                        .frame(width: 200, height: 50)
//                                        .padding()
//                                }
//                                
//                                List(viewModel.feedbackList) { feedback in
//                                    VStack(alignment: .leading) {
//                                        Text(feedback.title)
//                                            .font(.headline)
//                                        
//                                        Text(feedback.text)
//                                            .font(.body)
//                                            .foregroundColor(.gray)
//                                    }
//                                    .padding(.vertical)
//                                }
//                                
//                                Spacer()
//                            }
//                            .padding()
//                        }
//                    }
//                
//                Spacer()
//                
//                Button("Covid19 Rules") {
//                    showAlert = true
//                }
//                .alert(isPresented: $showAlert) {
//                    Alert(
//                        title: Text("Here can see the\nactuality Covid19 Rules"),
//                        message: Text("That you can also react faster as a student or even as a traveler. What the epidemic taught us")
//                    )
//                    
//                }
//                .foregroundColor(.red)
//                .background(.orange)
//                Spacer()
//                
//            }
//        ScrollView {
//                // Show Map
//                Button(action: {
//                    let coordinate = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
//                    let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
//                    mapItem.name = "Paris"
//                    mapItem.openInMaps(launchOptions: nil)
//                }) {
//                    Image("Map1")
//                        .resizable()
//                        .padding()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .cornerRadius(15)
//                }
//           
//                    VStack {
//                        Text("Eines der berühmtesten Wahrzeichen Roms ist zweifellos das Kolosseum. Dieses Amphitheater aus dem 1. Jahrhundert n. Chr. wurde für Gladiatorenkämpfe und andere öffentliche Veranstaltungen genutzt und ist heute eine der meistbesuchten Sehenswürdigkeiten der Stadt.")
//                            .padding()
//                            .foregroundColor(.gray)
//                            .fontWeight(.thin)
//                        
//                        Text("Ein weiteres beeindruckendes Bauwerk in Rom ist der Petersdom, der im Vatikanstaat liegt. Dieser imposante Kirchenbau ist eine der größten Kirchen der Welt und beherbergt zahlreiche Kunstwerke, darunter Michelangelos berühmte Pietà.")
//                            .padding()
//                            .foregroundColor(.gray)
//                            .fontWeight(.thin)
//                        
//                        Button("Buchen"){}
//                            .foregroundColor(.orange)
//                            .fontWeight(.bold)
//                        
//                    }
//                }
//            }
//        }
//import SwiftUI
//import MapKit
//
//struct HotelDetailRow3: View {
//    
//        @State private var showAlert = false
//        @EnvironmentObject var viewModel: ReiseAuswahlViewModel
//        
//        @State private var showingFeedbackSheet = false
//        @State private var feedbackTitle = ""
//        @State private var feedbackText = ""
//        @State private var offsetY: CGFloat = 0.0
//    
//    var body: some View {
//        
//        ZStack{
//            Image("canyon")
//                .resizable()
//                .frame(maxHeight: .infinity)
//                .clipped()
//                .ignoresSafeArea()
//            
//            Image("schild")
//                .resizable()
//                .frame(width: 290, height: 65)
//                .position(x: 200, y:196)
//        }
//        VStack{
//            HStack(spacing: 10) {
//                Spacer()
//                
//                Image(systemName: "wifi")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//                
//                Image(systemName: "sun.max")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//                
//                Image(systemName: "cross.case")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//                
//                Image(systemName: "cart.fill")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.yellow)
//                
//                Spacer()
//            }
//            Spacer()
//            // Price for one week
//            HStack {
//                Spacer(minLength: 60)
//                
//                Text("$999")
//                    .foregroundColor(.yellow)
//                    .font(.system(size: 28))
//                
//                Spacer()
//                
//                Text("Price/week")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 24))
//                Spacer()
//                
//            }
//            .padding(.bottom)
//            
//            VStack {
//                Text("SOS")
//                    .fontWeight(.semibold)
//                    .foregroundColor(.orange)
//                    .font(.title)
//                Text("all 50 Meters to next SOS Telephon")
//                    .font(.subheadline)
//
//            }
//            
//            HStack(spacing: 20) {
//            VStack{
//                Button(action: {
//                                showingFeedbackSheet.toggle()
//                            }) {
//                                Text("Feedback geben")
//                            }
//                        }
//                        .sheet(isPresented: $showingFeedbackSheet) {
//                            VStack {
//                                Text("Feedback geben")
//                                    .font(.title)
//                                    .foregroundColor(.orange)
//                                    .padding()
//                                
//                                Image("applogo")
//                                    .resizable()
//                                    .frame(width: 375, height: 175)
//                                    .padding()
//                                
//                                Text("Helfen Sie uns unseren Service\n stetig zu verbessern")
//                                    .font(.title3)
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(.white)
//                                    .padding()
//                                
//                                TextField("Titel", text: $feedbackTitle)
//                                    .padding()
//                                    .background(.gray).opacity(0.55)
//                                    .cornerRadius(25)
//
//                                
//                                TextField("Feedback-Text", text: $feedbackText)
//                                    .padding()
//                                    .background(.gray).opacity(0.55)
//                                    .cornerRadius(25)
//
//                                
//                                Button(action: {
//                                    viewModel.addFeedback(title: feedbackTitle, text: feedbackText)
//                                    feedbackTitle = ""
//                                    feedbackText = ""
//                                    showingFeedbackSheet = false
//                                }) {
//                                    Text("Hinzufügen")
//                                        .foregroundColor(.white)
//                                        .background(.orange)
//                                        .frame(width: 200, height: 50)
//                                        .padding()
//                                }
//                                
//                                List(viewModel.feedbackList) { feedback in
//                                    VStack(alignment: .leading) {
//                                        Text(feedback.title)
//                                            .font(.headline)
//                                        
//                                        Text(feedback.text)
//                                            .font(.body)
//                                            .foregroundColor(.gray)
//                                    }
//                                    .padding(.vertical)
//                                }
//                                
//                                Spacer()
//                            }
//                            .padding()
//                        }
//                    }
//                
//                Spacer()
//                
//                Button("Covid19 Rules") {
//                    showAlert = true
//                }
//                .alert(isPresented: $showAlert) {
//                    Alert(
//                        title: Text("Here can see the\nactuality Covid19 Rules"),
//                        message: Text("That you can also react faster as a student or even as a traveler. What the epidemic taught us")
//                    )
//                    
//                }
//                .foregroundColor(.red)
//                .background(.orange)
//                Spacer()
//                
//            }
//        ScrollView {
//                // Show Map
//                Button(action: {
//                    let coordinate = CLLocationCoordinate2D(latitude: 36.056595, longitude: -112.125092)
//                    let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
//                    mapItem.name = "Grand Canyon"
//                    mapItem.openInMaps(launchOptions: nil)
//                }) {
//                    Image("Map1")
//                        .resizable()
//                        .padding()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .cornerRadius(15)
//                }
//           
//                    VStack {
//                        Text("Eines der berühmtesten Wahrzeichen Roms ist zweifellos das Kolosseum. Dieses Amphitheater aus dem 1. Jahrhundert n. Chr. wurde für Gladiatorenkämpfe und andere öffentliche Veranstaltungen genutzt und ist heute eine der meistbesuchten Sehenswürdigkeiten der Stadt.")
//                            .padding()
//                            .foregroundColor(.gray)
//                            .fontWeight(.thin)
//                        
//                        Text("Ein weiteres beeindruckendes Bauwerk in Rom ist der Petersdom, der im Vatikanstaat liegt. Dieser imposante Kirchenbau ist eine der größten Kirchen der Welt und beherbergt zahlreiche Kunstwerke, darunter Michelangelos berühmte Pietà.")
//                            .padding()
//                            .foregroundColor(.gray)
//                            .fontWeight(.thin)
//                        
//                        Button("Buchen"){}
//                            .foregroundColor(.orange)
//                            .fontWeight(.bold)
//                        
//                    }
//                }
//            }
//        }
