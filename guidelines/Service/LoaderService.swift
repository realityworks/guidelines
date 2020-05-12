//
//  LoaderService.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import Foundation

// As an example, we would generally create this kind of protocol to be able to mock it during testing. Doing this just for proof of concept in this

protocol LoaderService {
    func loadFacts(onCompleted: @escaping (Facts?)->Void)
}
