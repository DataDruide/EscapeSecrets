//
//  HeaderShape1.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 05.04.23.
//


import SwiftUI

struct HeaderShape1 : View {
    
    @State private var JobViewIsShowing = false
    @State private var showBookingViewHelper = false
    @State private var searchText = ""
    @State private var showStewardessView = false
    var body: some View {
     
        VStack(alignment: .center) {
            HStack(spacing: 20) {
                    Button(action: {
                        self.JobViewIsShowing = true
                    }) {
                        Image(systemName: "graduationcap.circle")
                            .foregroundColor(Color.black)
                            .frame(width: 25, height: 25)
                            
                    }
                    .sheet(isPresented: $JobViewIsShowing) {
                        JobRow(viewModel: JobListViewModel())
                    }

                    Spacer()
                    Spacer()

                    Button(action: {
                        
                        self.showStewardessView = true
                    }) {
                        Image(systemName: "ticket.fill")
                            .foregroundColor(Color.black)
                            .frame(width: 50, height: 50)
                            
                    }
                    .sheet(isPresented: $showStewardessView) {
                        StewardessView()
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal)
            
            
        }
        
    }



struct HeaderShape1_Previews: PreviewProvider {
    static var previews: some View {
        HeaderShape1()
    }
}
