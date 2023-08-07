
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
    // Diese Methode registriert einen Beobachter für den Authentifizierungszustand.
    // Wenn sich der Authentifizierungszustand ändert (z. B. Anmeldung oder Abmeldung eines Benutzers),
    // wird die übergebene Closure aufgerufen, um den neuen Benutzer zurückzugeben.
    // Der Beobachter wird schwach referenziert, um mögliche Zyklen zu vermeiden.
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            self.user = user
        }
    }
    
    // Methode, um einen neuen Benutzer mit einer E-Mail-Adresse und einem Passwort zu registrieren
    // Diese Methode ermöglicht die Registrierung eines neuen Benutzers mit einer E-Mail-Adresse und einem Passwort.
    // Der Benutzer wird mit den übergebenen Anmeldeinformationen bei Firebase Authentication registriert.
    // Wenn ein Fehler auftritt, wird eine Fehlermeldung in der Konsole ausgegeben.
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("an error occurred \(error)")
                return
            }
         
        }
    }
    
    // Methode, um einen registrierten Benutzer mit einer E-Mail-Adresse und einem Passwort anzumelden
    // Diese Methode ermöglicht die Anmeldung eines registrierten Benutzers mit einer E-Mail-Adresse und einem Passwort.
    // Die Anmeldeinformationen werden mit Firebase Authentication überprüft, und bei erfolgreicher Anmeldung
    // wird der Benutzer als authentifizierter Benutzer in der App angemeldet.
    // Wenn ein Fehler auftritt, wird eine Fehlermeldung in der Konsole ausgegeben.
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("an error occurred \(error)")
                return
            }
  
        }
    }
    
    // Methode, um einen angemeldeten Benutzer abzumelden
    // Diese Methode ermöglicht es einem angemeldeten Benutzer, sich von Firebase Authentication abzumelden.
    // Wenn ein Fehler auftritt, wird eine Fehlermeldung in der Konsole ausgegeben.
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("an error occurred \(error)")
        }
  
    }
}
