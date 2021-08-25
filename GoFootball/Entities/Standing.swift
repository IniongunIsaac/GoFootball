//
//  Standing.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Standing: Codable {
    let stage, type: String
    let group: String?
    let table: [Table]
}
