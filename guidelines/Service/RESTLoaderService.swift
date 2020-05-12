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
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else { return }
        
        // Just use a URL Request here, we may need to update headers, or type
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse,
                httpURLResponse.statusCode == 200,
                error == nil,
                let data = data,
                let facts = try? JSONSerialization.jsonObject(with: data) as? Facts else {
                    print ("Error: \(error?.localizedDescription ?? "UnknownError")")
                    onCompleted(nil)
                    return
            }
            
            onCompleted(facts)
        }
    }
}


// Setup an instance provider here

extension RESTLoaderService {
    static let instance: RESTLoaderService = {
        RESTLoaderService()
    }()
}
