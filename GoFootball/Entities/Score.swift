//
//  Score.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Score: Codable {
    let winner, duration: String
    let fullTime, halfTime, extraTime, penalties: TimedScore
}
