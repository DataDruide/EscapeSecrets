//
//  JobRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//



import SwiftUI
import Foundation



struct JobRow: View {
    
    
    @ObservedObject var viewModel: JobListViewModel
    @State private var offsetY: CGFloat = 0.0
    
    
    var body: some View {
        NavigationView {
           
                
                VStack {
                    Spacer(minLength: 100)
                    SearchBar(searchTerm: $viewModel.searchTerm)
                    
                    if viewModel.jobs.isEmpty {
                        EmptyStateView()
                    } else {
                        List(viewModel.jobs) { job in
                            NavigationLink(destination: JobDetailView(job: job)) {
                                JobView2(job: job)
                            }
                        }
                        .listStyle(PlainListStyle())
                        .opacity(0.6) // Transparente Liste
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

