//
//  AppStorageAppApp.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct AppStorageAppApp: App {
    @EnvironmentObject var authService : AuthService

    @StateObject private var tripTide = TripTypeViewModel()
    @StateObject private var hotelTide = HotelTypeViewModel()
    @StateObject private var flightTide = FlightTypeViewModel()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(AuthService())
                .environmentObject(tripTide)
                .environmentObject(hotelTide)
                .environmentObject(flightTide)

        }
    }
}
