// Hier machen wir uns wieder die Frameworks zunutze
import Combine
import Foundation
import SwiftUI

// ViewModel für eine einzelne Job-Ansicht
class JobViewModel: Identifiable, ObservableObject {
    // Eigenschaften, die ein Job-Objekt repräsentieren
    let id: Int
    let title: String
    let companyName: String
    let category: String
    let postdate: String
    let location: String
    let salary: String
    let jobType: String
    
    // Initialisierung mit einem Job-Objekt
    init(job: Job) {
        self.id = job.id
        self.title = job.title
        self.companyName = job.companyName
        self.category = job.category
        self.postdate = job.postdate
        self.location = job.location
        self.salary = job.salary
        self.jobType = job.jobType
    }
}

// ViewModel für die Job-Liste
class JobListViewModel: ObservableObject {
    // @Published-Eigenschaft für die Suche nach Jobs
    @Published var searchTerm: String = " "
    // @Published-Array, das die aktuellen angezeigten Jobs enthält
    @Published public private(set) var jobs: [JobViewModel] = []
    
    // DataModel für den Zugriff auf Jobs
    private let dataModel: DataModel = DataModel()
    // Set für die Verwaltung der Abonnements
    private var disposables = Set<AnyCancellable>()
    
    init() {
        // Zu Beginn alle Jobs laden und in das ViewModel einfügen
        dataModel.loadJobs(searchTerm: "") { jobs in
            jobs.forEach { self.appendJob(job: $0) }
        }
        
        // Publisher für searchTerm beobachten, um Jobs basierend auf der Suchanfrage zu laden
        $searchTerm
            .sink(receiveValue: loadJobs(searchTerm:))
            .store(in: &disposables)
    }
    
    // Funktion zum Laden von Jobs basierend auf der Suchanfrage
    private func loadJobs(searchTerm: String) {
        // Zuerst alle Jobs aus der jobs-Eigenschaft entfernen
        jobs.removeAll()
        // Jobs basierend auf der Suchanfrage laden und dem ViewModel hinzufügen
        dataModel.loadJobs(searchTerm: searchTerm) { jobs in
            jobs.forEach { self.appendJob(job: $0) }
        }
    }

    // Funktion zum Hinzufügen eines Jobs zum ViewModel
    private func appendJob(job: Job) {
        // JobViewModel erstellen und dem ViewModel hinzufügen
        let jobViewModel = JobViewModel(job: job)
        DispatchQueue.main.async {
            self.jobs.append(jobViewModel)
        }
    }
}
