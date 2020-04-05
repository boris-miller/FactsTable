//
//  Row.swift
//  FactsTable
//
//  Created by Boris Miller on 6/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import Foundation

struct Row: Codable {
    let title: String?
    let rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
