//
//  JobDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 19.03.23.
//
import SwiftUI

struct JobDetailView: View {
    @ObservedObject var job: JobViewModel
    
    @State private var isContactButtonPressed = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 20) {
                Text(job.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("\(job.companyName)")
                    .font(.title2)
                    .foregroundColor(.purple.opacity(0.7))
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text((job.category == "") ? "Job Category: N/A" :"Job Category: \(job.category)")
                        Text((job.location == "") ? "Location: N/A" :"Location: \(job.location)")
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text((job.salary == "") ? "Salary: N/A" :"Salary: \(job.salary)")
                        Text((job.jobType == "") ? "Job Type: N/A" :"Job Type: \(job.jobType)")
                    }
                }
                .font(.headline)
                .foregroundColor(.white)
                Divider()
                Text("This job was posted at \(job.postdate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Button(action: {
                    self.isContactButtonPressed = true
                }) {
                    HStack {
                        Image(systemName: "paperplane.fill")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Contact")
                            .fontWeight(.semibold)
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(red: 75 / 255, green: 115 / 255, blue: 115 / 255))
                    )
                }
                .alert(isPresented: $isContactButtonPressed) {
                    Alert(
                        title: Text("Thank you for contacting us"),
                        message: Text("We'll get back to you as soon as possible."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.8))
            .cornerRadius(20)
            .padding()
            .navigationTitle(job.title)
            .navigationBarTitleDisplayMode(.inline)
        }
        .foregroundColor(.white)
    }
}
