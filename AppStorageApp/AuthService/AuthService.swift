//
//  AuthService.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import Foundation
import FirebaseAuth
final class AuthService: ObservableObject,BasicAuthService{
  func logIn(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password){result, error in
      if let error = error{
        print("an error occured : \(error.localizedDescription)")
        return
      }
    }
  }
  func logOut() {
    do{
      try Auth.auth().signOut()
    } catch let error{
      print("error signing out: \(error.localizedDescription)")
    }
  }
  var user : User?{
    didSet{
      objectWillChange.send()
    }
  }
  func listenToAuthState(){
    Auth.auth().addStateDidChangeListener { [weak self] _, user in
      guard let self = self else{
        return
      }
      self.user = user
    }
  }
  func signUp(email: String, password : String){
    Auth.auth().createUser(withEmail: email, password: password){result, error in
      if let error = error{
        print("an error occured: \(error.localizedDescription)")
        return
      }
    }
  }
}
