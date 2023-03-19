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
        NavigationView {
           
                
                VStack {
                    Image("flexibel")
                        .resizable()
                    HStack {
                        Text("hier ist für jeden\ndas richtige dabei ...")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        Button("Info") {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Here can you search Jobs"),
                                message: Text("Your current location can’t be " +
                                              "determined at this time.")
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
                                JobView2(job: job)
                            }
                        }.navigationTitle("Jobfinder")
                            .listStyle(.plain)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 1)).opacity(0.6)
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
        
            
        }
}

    
import SwiftUI

struct JobView2: View {
  @ObservedObject var job: JobViewModel
  var body: some View {
      
          VStack {
              HStack {
                  VStack() {
                      HStack {
                          Text(job.title)
                              .font(.title2)
                              .foregroundColor(Color(.black))
                      }
                      HStack {
                          Text((job.salary == "") ? "Salary: N/A" :"Salary: \(job.salary)")
                              .font(.footnote)
                              .foregroundColor(Color(.black))
                          Spacer()
                          Text((job.location == "") ? "Location: N/A" :"Location: \(job.location)")
                              .font(.footnote)
                              .foregroundColor(Color(.black))
                          Spacer()
                          Text((job.jobType == "") ? "Job Type: N/A" :"Job Type: \(job.jobType)")
                              .font(.footnote)
                              .foregroundColor(Color(.black))
                      }
                  }
                  .background(Color.purple)
                 
              
          }
    }
  }
}

import SwiftUI

struct EmptyStateView: View {
  var body: some View {
    VStack {
      Spacer()
      Image(systemName: "graduationcap.circle")
        .font(.system(size: 85))
        .padding(.bottom)
      Text("you are looking for a travel and work\n job then you are right here")
            .font(.headline)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
      Spacer()
    }
    .padding()
    .foregroundColor(Color(.purple))
  }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
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
