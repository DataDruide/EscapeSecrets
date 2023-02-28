//
//  JobListViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import Combine
import Foundation
import SwiftUI

class JobListViewModel: ObservableObject {
    
    @Published var searchTerm: String = " "
    @Published public private(set) var jobs: [JobViewModel] = []
    
    private let dataModel: DataModel = DataModel()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        dataModel.loadJobs(searchTerm: "") { jobs in
            jobs.forEach { self.appendJob(job: $0) }
        }
      $searchTerm
        .sink(receiveValue: loadJobs(searchTerm:))
        .store(in: &disposables)
    }
    
    private func loadJobs(searchTerm: String) {
      jobs.removeAll()
      dataModel.loadJobs(searchTerm: searchTerm) { jobs in
        jobs.forEach { self.appendJob(job: $0) }
      }
    }

    private func appendJob(job: Job) {
      let jobViewModel = JobViewModel(job: job)
      DispatchQueue.main.async {
        self.jobs.append(jobViewModel)
      }

    }
    
}

class JobViewModel: Identifiable, ObservableObject {
    
    let id: Int
    let title: String
    let companyName: String
    let category: String
    let postdate: String
    let location: String
    let salary: String
    let jobType: String
    init(job: Job) {
      self.id = job.id
      self.title = job.title
      self.companyName = job.companyName
      self.category = job .category
      self.postdate = job.postdate
      self.location = job.location
      self.salary = job.salary
      self.jobType = job.jobType
        
    }
  }
