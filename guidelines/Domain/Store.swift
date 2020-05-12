//
//  Store.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import Foundation

// We want to keep these in the store, because it's responsible for the list of facts
protocol StoreFactsLoaderDelegate {
    func didUpdateFacts()
    var delegateName: String { get }
}

class Store {
    // Let's leave this open for test case (just to show that we can do this with the kind of initialization we are performing
    let useCases: UseCases
    
    // This would be in a seperate State class where it can be managed for storage, but for brevity we'll just keep it here.
    private (set) var factsData: Facts? = nil
    
    // Normally we could use something like RX to manage multiple subscriptions, here we just use an array of delegates as an example
    var loaderDelegates: [StoreFactsLoaderDelegate] = []
    
    init(useCases: UseCases) {
        self.useCases = useCases
        
        useCases.onFactsLoaded = onFactsLoaded(facts:)
    }
    
    private func onFactsLoaded(facts: Facts?) {
        factsData = facts
        loaderDelegates.forEach { $0.didUpdateFacts() }
    }
}

extension Store {
    // Nice example of how we can create a singleton that supports mock objects (keeping the init public)
    // Also use lazy initialization
    static let instance: Store = {
        let store = Store(useCases: UseCases())
    
        return store
    }()
}
