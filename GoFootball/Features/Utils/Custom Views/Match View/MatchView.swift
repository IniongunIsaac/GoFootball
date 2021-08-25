//
//  MatchView.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class MatchView: BaseView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var topSeparatorView: UIView!
    @IBOutlet weak var bottomSeparatorView: UIView!
    @IBOutlet weak var homeTeamBadgeImageView: UIImageView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamBadgeImageView: UIImageView!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var middleDividerView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override var kContentView: UIView { contentView }
    override var nibName: String { R.nib.matchView.name }
    
    override func configureViews() {
        super.configureViews()
    }
    
    func setup(with match: Match) {
        match.do {
            homeTeamNameLabel.text = $0.homeTeam.name
            awayTeamNameLabel.text = $0.awayTeam.name
            homeTeamScoreLabel.text = $0.score.fullTime.homeTeam?.string
            awayTeamScoreLabel.text = $0.score.fullTime.awayTeam?.string
            timeLabel.text = $0.time
        }
    }

}
