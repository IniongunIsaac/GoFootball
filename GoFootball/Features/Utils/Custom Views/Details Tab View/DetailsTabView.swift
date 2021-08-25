//
//  DetailsTabView.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class DetailsTabView: BaseView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    override var kContentView: UIView { contentView }
    override var nibName: String { R.nib.detailsTabView.name }
    
    @IBInspectable var text: String {
        get { textLabel.text.orEmpty }
        set { textLabel.text = newValue }
    }
    
    @IBInspectable var textColor: UIColor? {
        get { textLabel.textColor }
        set { textLabel.textColor = newValue }
    }
    
    @IBInspectable var bgColor: UIColor? {
        get { detailsView.backgroundColor }
        set { detailsView.backgroundColor = newValue }
    }
    
    @IBInspectable var isActive: Bool = false {
        didSet {
            activate(isActive)
        }
    }
    
    func activate(_ activate: Bool = true) {
        if activate {
            detailsView.backgroundColor = .accentColor
            textLabel.textColor = .white
        } else {
            detailsView.backgroundColor = .aSecondarySystemBackground
            textLabel.textColor = .aSecondaryLabel
        }
    }

}
