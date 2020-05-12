//
//  FactLoader.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import Foundation

// Implement the loader service via the rest calls
class RESTLoaderService: LoaderService {
    func loadFacts(onCompleted: @escaping (Facts?)->Void) {
        onCompleted(nil)
    }
}


// Setup an instance provider here

extension RESTLoaderService {
    static let instance: RESTLoaderService = {
        RESTLoaderService()
    }()
}
