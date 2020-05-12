//
//  UseCases.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import Foundation

class UseCases {
    private let loaderService: LoaderService
    var onFactsLoaded: ((Facts?)->())? = nil
    
    init(_ dependencies: Dependencies = .real) {
        self.loaderService = dependencies.loaderService
    }
    
    func loadData() {
        loaderService.loadFacts(onCompleted: onFactsLoaded ?? { _ in })
    }
}

// Another example of how the use cases will have a set of services that we needs

extension UseCases {
    struct Dependencies {
        let loaderService: LoaderService
        
        // Here you can see how the dependencies are being tied to concrete classes
        static let real = Dependencies(loaderService: RESTLoaderService.instance)
    }
}
