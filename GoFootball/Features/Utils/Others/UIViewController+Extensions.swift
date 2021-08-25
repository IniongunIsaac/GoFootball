//
//  UIViewController+Extensions.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import Toast_Swift

extension UIViewController {
    
    func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        view.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    func setViewControllers(with viewController: UIViewController, animate: Bool = false) {
        navigationController?.setViewControllers([viewController], animated: animate)
    }
    
    func pushViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func popToRootViewController(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func dismissViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    func presentViewController(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(viewController, animated: animated, completion: completion)
    }
    
    func hideNavBar(_ shouldHide: Bool = true) {
        self.navigationController?.navigationBar.isHidden = shouldHide
    }
    
    func share(content: Any) {
        let activityController = UIActivityViewController(activityItems: [content], applicationActivities: nil)
        activityController.excludedActivityTypes = [.print, .saveToCameraRoll, .assignToContact, .addToReadingList, .airDrop]
        activityController.popoverPresentationController?.sourceView = view
        present(activityController, animated: true)
    }
    
    func enableSwipeBackToPopGesture(_ enable: Bool = true) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = enable
    }
    
    func disableNavBar() {
        navigationController?.navigationBar.subviews.disableUserInteraction()
    }
    
    func enableNavBar() {
        navigationController?.navigationBar.subviews.enableUserInteraction()
    }
    
    func showAlert(message: String, type: AlertType, duration: TimeInterval = 3.0, dismissCompletion: (() -> Void)? = nil) {
        view.hideAllToasts()
        var color: UIColor = .appGreen
        switch type {
        case .error:
            color = .appRed
        case .info:
            color = .appInfo
        case .success:
            color = .appGreen
        }
        
        var toastStyle = ToastStyle()
        toastStyle.messageColor = .white
        toastStyle.messageFont = .nunitoLight(size: 14)
        toastStyle.backgroundColor = color
        
        ToastManager.shared.isTapToDismissEnabled = true
        
        view.makeToast(message, duration: duration, position: .top, style: toastStyle)
    }
    
    func hideAlert() {
        view.hideAllToasts()
    }
    
}
