//
//  Match.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Match: Codable, Scopable {
    let id: Int
    let season: Season
    let utcDate: String
    let status: String
    let matchday: Int
    let stage: String
    let group: String?
    let lastUpdated: String
    let odds: Odds
    let score: Score
    let homeTeam, awayTeam: Team
    let referees: [Referee]
    
    var time: String {
        if status == "SCHEDULED" {
            return utcDate.displayTime
        } else {
            return "Full-Time"
        }
    }
}
