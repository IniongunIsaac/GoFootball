//
//  CompetitionsResponse.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct CompetitionsResponse: Codable {
    let count: Int?
    let filters: AnyStruct
    let competitions: [Competition]
}
