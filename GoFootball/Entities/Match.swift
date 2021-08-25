//
//  Match.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Match: Codable {
    let id: Int
    let season: Season
    let utcDate: Date
    let status: String
    let matchday: Int
    let stage: String
    let group: String?
    let lastUpdated: Date
    let odds: Odds
    let score: Score
    let homeTeam, awayTeam: Team
    let referees: [Referee]
}
