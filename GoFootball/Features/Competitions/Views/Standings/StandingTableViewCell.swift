//
//  StandingTableViewCell.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class StandingTableViewCell: UITableViewCell {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamBadgeImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playedLabel: UILabel!
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var drawnLabel: UILabel!
    @IBOutlet weak var lossLabel: UILabel!
    @IBOutlet weak var goalDifferenceLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    func configureView(table: Table) {
        table.do {
            positionLabel.text = $0.position.string
            if let teamCrestURL = $0.team.crestUrl {
                teamBadgeImageView.setImageFromURL(url: teamCrestURL)
            }
            teamNameLabel.text = $0.team.name
            playedLabel.text = $0.playedGames.string
            wonLabel.text = $0.won.string
            drawnLabel.text = $0.draw.string
            lossLabel.text = $0.lost.string
            goalDifferenceLabel.text = $0.goalDifference.string
            pointsLabel.text = $0.points.string
        }
    }

}
