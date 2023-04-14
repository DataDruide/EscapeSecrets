//
//  TravelDiscoveryDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 03.04.23.
//
import SwiftUI
import Foundation

class HeaderToDoViewModel : ObservableObject {
    @Published var isLoading = true
    @Published var places = [Int]()

    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            self.places = [1,2,3,4,5]
        }
    }
}

struct ActivityIndicatorView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .black
        return aiv
    }
    
    
    typealias UIViewType = UIActivityIndicatorView

    
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

    }
   
}


import SwiftUI

struct TravelDiscoveryDetailView: View {
    
    @ObservedObject var vm = HeaderToDoViewModel()
    
    let name: String
    let country: String
    let imageName: String
    var body: some View {
        VStack {
            Image(country)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            Text(name)
                .font(.system(size: 34, weight: .semibold))
                .foregroundColor(.black)
        }
        .background(Color.black)
    }
}
struct TravelDiscoveryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TravelDiscoveryDetailView(name: "", country: "",imageName: "")
    }
}
