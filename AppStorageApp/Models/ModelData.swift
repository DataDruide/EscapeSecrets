//
//  ModelData.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//


import Foundation
import Alamofire

class DataModel {
  private var dataTask: URLSessionDataTask?
    private var baseUrl =  URL(string: "https://remotive.io/api/remote-jobs/")

    func loadJobs(searchTerm: String, completion: @escaping(([Job]) -> Void)) {
        let url = buildUrl(forTerm: searchTerm)
        AF.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { (responseData) in
                guard let data = responseData.data else {
                    completion([])
                    return
                }
                if let jobResponse = try? JSONDecoder().decode(JobResponse.self, from: data) {
                    completion(jobResponse.jobs)
                }
            }
        }
   private func buildUrl(forTerm searchTerm: String) -> URL? {
    guard !searchTerm.isEmpty else { return baseUrl }
    let queryItems = [URLQueryItem(name: "search", value: searchTerm)]
    var components = URLComponents(string: "https://remotive.io/api/remote-jobs")
    components?.queryItems = queryItems
    return components?.url
  }
}

