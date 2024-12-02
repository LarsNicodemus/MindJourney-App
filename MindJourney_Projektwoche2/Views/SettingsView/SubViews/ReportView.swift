//
//  ReportView.swift
//  TraumJobs
//
//  Created by Andreas Beer on 29.10.24.
//

import SwiftUI

struct ReportView: View {
    @AppStorage("Report") private var report: String = "Type in text here"
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Report an Issue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("Please describe your issue below:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)

            

            Button(action: {
                if report.isEmpty || report == "Type in text here" {
                    showAlert = true
                } else {
                    print("Report sent: \(report)")
                    report = ""
                }
            }) {
                Text("Send Report")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Please enter a valid issue description."), dismissButton: .default(Text("OK")))
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(20)
    }
}

#Preview {
    ReportView()
}
