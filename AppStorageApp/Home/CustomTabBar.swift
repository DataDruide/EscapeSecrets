//
//  CustomTabBar.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Text("View 1")
                .tabItem {
                    VStack {
                        Image(systemName: "1.circle")
                        Home()
                    }
                }
                .tag(0)
            
            Text("View 2")
                .tabItem {
                    VStack {
                        Image(systemName: "2.circle")
                        PlaneView()
                    }
                }
                .tag(1)
            
            Text("View 3")
                .tabItem {
                    VStack {
                        Image(systemName: "3.circle")
                        ProfilView()
                    }
                }
                .tag(2)
            
            Text("View 4")
                .tabItem {
                    VStack {
                        Image(systemName: "4.circle")
                        JobView()
                    }
                }
                .tag(3)
            Text("View 4")
                .tabItem {
                    VStack {
                        Image(systemName: "4.circle")
                        HotelView()
                    }
                }
                .tag(4)
            Text("View 4")
                .tabItem {
                    VStack {
                        Image(systemName: "4.circle")
                        Text("View 4")
                    }
                }
                .tag(5)
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
