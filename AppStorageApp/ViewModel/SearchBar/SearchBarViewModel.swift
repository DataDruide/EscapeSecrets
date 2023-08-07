// Zugänglichkeit zu den Frameworks
import SwiftUI
import Combine

final class SearchBarViewModel: ObservableObject {
    // AnyCancellable wird im Combine Framework verwendet um auf Veränderungen zu reagieren und sie auch anzuzeigen
    private var disposeBag = Set<AnyCancellable>()
    
    // Diese Variable ermöglicht den Zugriff auf den aktuellen Text im Suchfeld
    @Published var searchText: String = ""
    
    // Initialisierer (Konstruktor) der Klasse
    init() {
        // Rufe die Funktion debounceTextChanges auf, um das Textänderungs-Debouncing einzurichten
        self.debounceTextChanges()
    }
    
    // Funktion zur Einrichtung des Debouncing für Textänderungen
    private func debounceTextChanges() {
        $searchText
            // Textänderungen werden für 2 Sekunden zwischengespeichert (debounced)
            .debounce(for: 2, scheduler: RunLoop.main)
        
            // Diese Closure wird aufgerufen, nachdem sich der Text für 2 Sekunden nicht mehr ändert (beendetes Tippen)
            .sink { newText in
                // Hier wird der neue Textwert ausgedruckt
                print("new text value: \(newText)")
            }
            // Speichere den Combine-Cancellable (Subscription) in disposeBag, um später darauf zugreifen zu können
            .store(in: &disposeBag)
        
        // Zweiter Subscriber, der auf den neuen Text reagiert, jedoch keine Aktion durchführt
        $searchText
            .sink { returnedText in
                // Dieser Teil ist leer und führt keine Aktion durch, dient aber als Beispiel für einen weiteren Subscriber
                // Du könntest hier zusätzliche Logik oder Aktionen basierend auf dem neuen Textwert durchführen
            }
            .store(in: &disposeBag) // Speichere den Combine-Cancellable (Subscription) in disposeBag
    }
}
