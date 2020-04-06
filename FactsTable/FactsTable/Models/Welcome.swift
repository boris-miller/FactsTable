//
//  Welcome.swift
//  FactsTable
//
//  Created by Boris Miller on 6/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let title: String
    let rows: [Row]
}
