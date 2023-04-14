//
//  SearchBarViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 30.03.23.
//

import SwiftUI
import Combine

final class SearchBarViewModel: ObservableObject {
    
    private var disposeBag = Set<AnyCancellable>()
    
    // machen die variablen zugänglich

    @Published var searchText: String = ""
    // initializer
    init() {
        self.debounceTextChanges()
    }
    
    private func debounceTextChanges() {
        $searchText
        // 2 second debounce
            .debounce(for: 2, scheduler: RunLoop.main)
        
        // Called after 2 seconds when text stops updating (stoped typing)
            .sink {
                print("new text value: \($0)")
            }
            .store(in: &disposeBag)
        
        $searchText
            .sink { (returnedText) in
                self.disposeBag
            }
    }
}
