
import Foundation
import Alamofire

// Das Datenmodell, das die Funktionalität zum Laden von Remote-Jobs bereitstellt.
class DataModel {
    // Eine private URLSessionDataTask-Instanz, die zum Laden von Daten verwendet wird.
    private var dataTask: URLSessionDataTask?
    // Die Basis-URL für die Remote-Jobs API.
    private var baseUrl = URL(string: "https://remotive.io/api/remote-jobs/")
    
    // Eine Funktion zum Laden von Remote-Jobs basierend auf einem Suchbegriff.
    func loadJobs(searchTerm: String, completion: @escaping (([Job]) -> Void)) {
        // Erstelle die URL basierend auf dem Suchbegriff.
        let url = buildUrl(forTerm: searchTerm)
        
        // Führe eine HTTP-Anfrage mit Alamofire durch.
        AF.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { (responseData) in
                guard let data = responseData.data else {
                    // Wenn keine Daten vorhanden sind, rufe die Completion mit einem leeren Array auf.
                    completion([])
                    return
                }
                // Versuche, die empfangenen Daten zu deserialisieren und das Ergebnis zurückzugeben.
                if let jobResponse = try? JSONDecoder().decode(JobResponse.self, from: data) {
                    completion(jobResponse.jobs)
                }
            }
    }
    
    // Eine private Funktion zum Erstellen der URL basierend auf einem Suchbegriff.
    private func buildUrl(forTerm searchTerm: String) -> URL? {
        // Überprüfe, ob der Suchbegriff leer ist, und gib die Basis-URL zurück, wenn dies der Fall ist.
        guard !searchTerm.isEmpty else { return baseUrl }
        // Erstelle eine Liste von URLQueryItems, um den Suchbegriff an die URL anzuhängen.
        let queryItems = [URLQueryItem(name: "search", value: searchTerm)]
        // Erstelle eine URLComponents-Instanz mit der Basis-URL.
        var components = URLComponents(string: "https://remotive.io/api/remote-jobs")
        // Füge die Query-Parameter zur URL hinzu.
        components?.queryItems = queryItems
        // Gib die fertige URL zurück.
        return components?.url
    }
}
