//
//  FactLoader.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import Foundation

// Implement the loader service via the rest calls
struct Potter:Decodable {
    let title: String
    let author: String
    let imageURL: String
}

class RESTLoaderService: LoaderService {
    func loadFacts(onCompleted: @escaping (Facts?)->Void) {
        let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        //let urlString = "https://de-coding-test.s3.amazonaws.com/books.json"
        guard let url = URL(string: urlString) else { return }
        
        // Just use a URL Request here, we may need to update headers, or type
        URLSession.shared.dataTask(with: url) { data, response, urlError in
            // Check the URL was read correctly
            guard
                let httpURLResponse = response as? HTTPURLResponse,
                httpURLResponse.statusCode == 200,
                urlError == nil,
                let data = data else {
                    print ("Error: \(urlError?.localizedDescription ?? "UnknownHTTPError")")
                    onCompleted(nil)
                    return
            }
            
            do {
                let decoder = JSONDecoder()
                let text = String(data: data, encoding: .windowsCP1252)
                if let dataFromString = text?.data(using: .utf8, allowLossyConversion: false) {
                    let facts = try decoder.decode(Facts.self, from: dataFromString)
                    onCompleted(facts)
                }
            } catch {
                print ("Failed Decoding \(error)")
            }
        }.resume()
    }
}


// Setup an instance provider here

extension RESTLoaderService {
    static let instance: RESTLoaderService = {
        RESTLoaderService()
    }()
}
