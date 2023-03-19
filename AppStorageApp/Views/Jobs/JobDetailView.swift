//
//  JobDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 19.03.23.
//

import SwiftUI

struct JobDetailView: View {
    @ObservedObject var job: JobViewModel
    
    var body: some View {
        ZStack {
            Image("Background_gradient")
                .resizable()
                .ignoresSafeArea(.all)
            
            
            List {
                VStack(alignment: .center) {
                    Text(job.title)
                        .font(.title)
                        .foregroundColor(.black)
                    Text("\(job.companyName)")
                        .font(.title2)
                        .foregroundColor(.purple.opacity(0.7))
                }
                VStack(alignment: .leading) {
                    Spacer()
                    VStack(alignment: .center, spacing: 10) {
                        Text((job.category == "") ? "Job Category: N/A" :"Job Category: \(job.category)")
                        Text((job.location == "") ? "Location: N/A" :"Location: \(job.location)")
                        Text((job.salary == "") ? "Salary: N/A" :"Salary: \(job.salary)")
                        Text((job.jobType == "") ? "Job Type: N/A" :"Job Type: \(job.jobType)")
                    }
                    .font(.headline)
                    .foregroundColor(.black)
                    Spacer()
                    Button(action: { }) {
                        HStack {
                            Image(systemName: "paperplane.fill")
                                .font(.title)
                            Text("Contact")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .foregroundColor(.black)
                        .background(Color.purple).opacity(0.55)
                        .cornerRadius(40)
                    }
                    Spacer()
                    Divider()
                    Text("This job was posted at \(job.postdate)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
            .navigationTitle(job.title)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.purple)
        }
    }
    
}
