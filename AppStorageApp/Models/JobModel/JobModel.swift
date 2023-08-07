import Foundation

// Das Modell für die Job-Antwort.
struct JobResponse: Identifiable, Decodable {
    // Eine eindeutige ID, die automatisch generiert wird (UUID).
    var id = UUID()
    // Eine Liste von Jobs, die in der Antwort enthalten sind.
    let jobs: [Job]
    
    // Die CodingKeys zum Dekodieren der JSON-Daten.
    enum CodingKeys: String, CodingKey {
        case jobs
    }
}

// Das Modell für einen Job.
struct Job: Decodable {
    // Die eindeutige ID des Jobs.
    let id: Int
    // Der Titel des Jobs.
    let title: String
    // Der Name des Unternehmens, das den Job anbietet.
    let companyName: String
    // Die Kategorie des Jobs.
    let category: String
    // Das Veröffentlichungsdatum des Jobs.
    let postdate: String
    // Der Ort, an dem der Kandidat für den Job erforderlich ist.
    let location: String
    // Das Gehalt des Jobs.
    let salary: String
    // Der Job-Typ (z. B. Vollzeit, Teilzeit, etc.).
    let jobType: String
    
    // Die CodingKeys zum Dekodieren der JSON-Daten.
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case companyName = "company_name"
        case category
        case postdate = "publication_date"
        case location = "candidate_required_location"
        case salary
        case jobType = "job_type"
    }
}
