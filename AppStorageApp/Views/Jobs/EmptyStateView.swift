//
//  EmptyStateView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct EmptyStateView: View {
  var body: some View {
    VStack {
      Spacer()
      Image(systemName: "graduationcap.circle")
        .font(.system(size: 85))
        .padding(.bottom)
      Text("you are looking for a travel and work\n job then you are right here")
            .font(.headline)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
      Spacer()
    }
    .padding()
    .foregroundColor(Color(.systemOrange))
  }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
