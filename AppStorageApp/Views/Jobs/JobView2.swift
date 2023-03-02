//
//  JobView2.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct JobView2: View {
  @ObservedObject var job: JobViewModel
  var body: some View {
    VStack {
        HStack {
            VStack( alignment: .leading) {
            HStack {
                Text(job.title)
                    .font(.title2)
                    .foregroundColor(Color(.black))
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
            .background(Color.gray)
            }
        }
    }
  }
}
