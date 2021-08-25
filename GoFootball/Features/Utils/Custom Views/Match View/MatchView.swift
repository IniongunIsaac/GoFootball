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
    
    override var kContentView: UIView { contentView }
    override var nibName: String { "" }

}
