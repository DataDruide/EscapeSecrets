//
//  JobView2.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 14.04.23.
//

import SwiftUI

struct JobView2: View {
  @ObservedObject var job: JobViewModel
  @State var liked: Bool = false
  
  var body: some View {
    VStack {
      HStack {
        VStack() {
          HStack {
            Text(job.title)
              .font(.title2)
              .foregroundColor(Color(.white))
          }
          HStack {
            Text((job.salary == "") ? "Salary: N/A" :"Salary: \(job.salary)")
              .font(.footnote)
              .foregroundColor(Color(.white))
            Spacer()
            Text((job.location == "") ? "Location: N/A" :"Location: \(job.location)")
              .font(.footnote)
              .foregroundColor(Color(.white))
            Spacer()
            Text((job.jobType == "") ? "Job Type: N/A" :"Job Type: \(job.jobType)")
              .font(.footnote)
              .foregroundColor(Color(.white))
          }
        }
        .padding()
        
        Button(action: {
          liked.toggle()
        }) {
          Image(systemName: liked ? "heart.fill" : "heart")
            .foregroundColor(Color.red)
        }
      }
    }
    .background( LinearGradient(colors: [.black,.black,.gray], startPoint: .topLeading, endPoint: .bottomLeading)
        .edgesIgnoringSafeArea(.all))
  }
}
struct JobView2_Previews: PreviewProvider {
  static var previews: some View {
      let exampleJob = Job(id: 1, title: "Software Engineer", companyName: "San Francisco, CA", category: "$120k - $150k", postdate: "Full-time", location: "Mercedes", salary: "Service", jobType: "Service")
    let jobViewModel = JobViewModel(job: exampleJob)
    return JobView2(job: jobViewModel)
  }
}
