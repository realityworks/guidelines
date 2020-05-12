//
//  Facts.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import Foundation


struct Facts: Decodable {
    
    let title: String
    let rows: [Fact]
    
    struct Fact: Decodable {

        let title: String?
        let description: String?
        let imageHref: String?
    }
}
