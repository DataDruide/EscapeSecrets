//
//  OnBoardingPageThree.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct MainAppView: View {
  @AppStorage("onBoarding")  var onBoarding = true
    
    @Binding var show : Bool

    var body: some View {
        VStack {
            if onBoarding {
                OnBoardingPageOne()
            } else {
                MainView(show: $show)
                    .transition(.opacity.animation(.default))
            }
        }
        }
    }

