import Foundation
import MapKit // Framework um uns später die GoogleMaps Karte anzuzeigen

// ViewModel für die Model View des Trips
class TripTypeViewModel : ObservableObject {
    // @Published-Array für Aktivitäten (Activities), die der Reise hinzugefügt werden können
    @Published var activities : [Activities] = []
    // @Published-Array für Orte (Places)
    @Published var places : [Places] = []
    // @Published-Integer für die Gesamtsumme der Preise der ausgewählten Aktivitäten
    @Published var total : Int = 0
    // @Published-String für die Sucheingabe
    @Published var searchText : String = ""
   
    // Funktion zum Hinzufügen einer Aktivität zur Reise
    func addActivities(newItem: Activities) {
        // Die neue Aktivität zur Aktivitätenliste hinzufügen
        activities.append(newItem)
        // Den Preis der neuen Aktivität zur Gesamtsumme hinzufügen
        total += newItem.price
    }
    
    // Funktion zum Entfernen einer Aktivität aus der Reise
    func removeFromCart (newItem: Activities){
        // Die Aktivität aus der Aktivitätenliste filtern und entfernen
        activities = activities.filter{ $0.id != newItem.id}
        // Den Preis der entfernten Aktivität von der Gesamtsumme abziehen
        total -= newItem.price
    }
}

