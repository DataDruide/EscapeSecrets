//
//  AuthService.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//


import Foundation
import FirebaseAuth
import Foundation
import FirebaseAuth

// Die Klasse AuthService ist eine ObservableObject-Klasse, die verschiedene Methoden zur Verwaltung der Authentifizierungsfunktionen enthält
final class AuthService: ObservableObject {
    
    // Die Eigenschaft "user" ist ein optionaler User und wird aktualisiert, wenn sich der Authentifizierungszustand ändert
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    // Methode, um einen Listener für Änderungen des Authentifizierungszustands hinzuzufügen
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            self.user = user
        }
    }
    
    // Methode, um einen neuen Benutzer mit einer E-Mail-Adresse und einem Passwort zu registrieren
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("an error occured \(error)")
                return
            }
        }
    }
    
    // Methode, um einen registrierten Benutzer mit einer E-Mail-Adresse und einem Passwort anzumelden
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("an error occured \(error)")
                return
            }
        }
    }
    
    // Methode, um einen angemeldeten Benutzer abzumelden
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("an error occured \(error)")
        }
    }
}
