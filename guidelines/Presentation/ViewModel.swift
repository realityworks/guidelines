//
//  ViewModel.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import Foundation

// Example of how to seperate our model (store) / loaders (service) / use cases and the view
// Using an MVVM style architecture along with SOLID principles

class ViewModel {
    private let store: Store
    private let useCases: UseCases
    
    init(_ dependencies: Dependencies = .real) {
        self.store = dependencies.store
        self.useCases = dependencies.useCases
        
        // Todo: Setup to add notifier on data updates
    }
}


// Let's use a nice clean dependencies structure that wraps all of our needs into one argument. Instead of passing a collection of arguments to the view model.

// In a larger project, you would have more transports and use cases. Each one with a single responsibility.
extension ViewModel {
    struct Dependencies {
        let store: Store
        let useCases: UseCases
        
        static var real = Dependencies(
            store: Store.instance,
            useCases: Store.instance.useCases)
    }
}