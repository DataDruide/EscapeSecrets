//
//  BasicAuthService.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import Foundation
import SwiftUI
protocol BasicAuthService{
  func logIn(email : String,password:String)
  func logOut()
  func signUp(email : String,password:String)
  func listenToAuthState()
}
