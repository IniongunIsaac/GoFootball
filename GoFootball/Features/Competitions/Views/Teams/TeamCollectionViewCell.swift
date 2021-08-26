//
//  TeamTableViewCell.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var crestImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureView(team: Team) {
        team.do {
            if let crestUrl = $0.crestUrl {
                crestImageView.setImageFromURL(url: crestUrl)
            }
            nameLabel.text = $0.name
        }
    }
    
}
