//
//  JobRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//



import SwiftUI
import Foundation



struct JobRow: View {
    
    @State private var showAlert = false
    
    
    @ObservedObject var viewModel: JobListViewModel
    @State private var offsetY: CGFloat = 0.0
    
    
    var body: some View {
       
            NavigationStack {
                
                ZStack {
                    // Hintergrundbildansicht
                    Color.black
                        .ignoresSafeArea()
                    
                    VStack(alignment: HorizontalAlignment.center) {
                    Image("flexibel")
                        .resizable()
                        .frame(maxWidth: 400, maxHeight: 600)
                        .shadow(color: .gray, radius: 0.5, x: 1.00, y: 1)
                        .multilineTextAlignment(.center)
                    HStack {
                        Text("Ihr Jobfinder für jede Reiselage")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                        
                        Button("Info") {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("You need a Job"),
                                message: Text("..... you need a Job than come in and find out....")
                            )
                            
                        }
                    }
                    Spacer(minLength: 10)
                    SearchBar(searchTerm: $viewModel.searchTerm)
                    
                    if viewModel.jobs.isEmpty {
                        EmptyStateView()
                    } else {
                        List(viewModel.jobs) { job in
                            NavigationLink(destination: JobDetailView(job: job)) {
                                JobView(job: job)
                            }
                        }.navigationTitle("Jobfinder")
                            .listStyle(.plain)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 1)).opacity(0.8)
                            .offset(y: offsetY)
                            .gesture(DragGesture().onChanged({ value in
                                self.offsetY = value.translation.height
                            }).onEnded({ value in
                                withAnimation(.spring()) {
                                    if offsetY > 50 {
                                        offsetY = UIScreen.main.bounds.height
                                    } else if offsetY < -50 {
                                        offsetY = -UIScreen.main.bounds.height
                                    } else {
                                        offsetY = 0
                                    }
                                }
                            }))
                    }
                }
            }
            
            
       }.background(Color.black)
    }
}



import SwiftUI

struct SearchBar: UIViewRepresentable {
  typealias UIViewType = UISearchBar
  @Binding var searchTerm: String

  func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.delegate = context.coordinator
    searchBar.searchBarStyle = .minimal
    searchBar.placeholder = "Type a job title, category, location..."
    return searchBar
  }
  func updateUIView(_ uiView: UISearchBar, context: Context) {
  }
  func makeCoordinator() -> SearchBarCoordinator {
    return SearchBarCoordinator(searchTerm: $searchTerm)
  }
  class SearchBarCoordinator: NSObject, UISearchBarDelegate {
    @Binding var searchTerm: String
    init(searchTerm: Binding<String>) {
      self._searchTerm = searchTerm
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchTerm = searchBar.text ?? ""
      UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
    }
  }
}
