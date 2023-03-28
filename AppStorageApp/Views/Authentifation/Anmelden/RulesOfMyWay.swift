//
//  OnBoardingPageThree.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI
// Hier regeln wir die Onboardregeln 
struct RulesOfMyWay: View {
    
    @EnvironmentObject var authService : AuthService
  @AppStorage("onBoarding")  var onBoarding = true
    
    @Binding var show : Bool

    var body: some View {
        VStack {
            if onBoarding {
                OnBoardingPageOne()
            } else {
                Group{
                    if authService.user != nil{
                        Home()
                    }else{
                        YourWayView(show: $show)
                            .transition(.opacity.animation(.default))                    }
                }.onAppear{
                    authService.listenToAuthState()
                }
               
            }
        }
        }
    }

