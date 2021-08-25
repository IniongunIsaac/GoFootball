//
//  EmptyView.swift
//  Food GIG
//
//  Created by Isaac Iniongun on 16/11/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import UIKit

class EmptyView: BaseView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emptyIconImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var reloadIconImageView: UIImageView!
    
    override var nibName: String { R.nib.emptyView.name }
    override var kContentView: UIView { contentView }
    
    @IBInspectable var messageText: String {
        get { messageLabel.text.orEmpty }
        set { messageLabel.text = newValue }
    }
    
    @IBInspectable var emptyIcon: UIImage? {
        get { emptyIconImageView.image }
        set { emptyIconImageView.image = newValue }
    }
    
    @IBInspectable var bgColor: UIColor? {
        get { contentView.backgroundColor }
        set { contentView.backgroundColor = newValue }
    }
    
    @IBInspectable var showRetryIcon: Bool {
        get { reloadIconImageView.isHidden }
        set { reloadIconImageView.showView(newValue) }
    }
    
    @IBInspectable var showEmptyIcon: Bool {
        get { emptyIconImageView.isHidden }
        set { emptyIconImageView.showView(newValue) }
    }
    
    var retryTapHandler: NoParamHandler?
    
    override func configureViews() {
        super.configureViews()
        contentView.addClearBackground()
        reloadIconImageView.animateViewOnTapGesture { [weak self] in
            self?.retryTapHandler?()
        }
    }
}
