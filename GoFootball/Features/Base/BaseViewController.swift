//
//  BaseViewController.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import HorizontalProgressBar
import DeviceKit
import Toast_Swift

/// A Base Class that abstracts common functionalities of UIViewControllers
class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var progressBar: HorizontalProgressbar?
    
    /// Determines the position of the horizontal progress bar on the UI
    var horizontalProgressBarYPosition: CGFloat {
        navigationController?.navigationBar.frame.maxY ?? (Device.current.isOneOf(Device.allDevicesWithSensorHousing + Device.allSimulatorDevicesWithSensorHousing) ? 88 : 64)
    }
    
    /// Get's any subtype of `BaseViewModel` with which the ViewController listens for or observes emissions for errors, loading and alerts
    /// and performs the needed actions such as showing or hiding the loading animation and showing alerts.
    /// All subtypes of `BaseViewModel` share this common functionality.
    /// - Returns: a subtype of `BaseViewModel`
    var kViewModel: BaseViewModel {
        preconditionFailure("BaseViewController subclass must provide a subclass of BaseViewModel")
    }
    
    var views: [UIView] { [] }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setObservers()
        
        kViewModel.viewDidLoad()
        
        configureViews()
        
    }
    
    func configureViews() {}
    
    fileprivate func createHorizontalProgressBar() {
        progressBar = HorizontalProgressbar(frame: CGRect(x: 0, y: horizontalProgressBarYPosition, width: view.frame.width, height: 4))
        view.addSubview(progressBar!)
        progressBar?.noOfChunks = 1  // You can provide number of Chunks/Strips appearing over the animation. By default it is 3
        progressBar?.kChunkWdith = Double(view.frame.width) - 20 // Adjust the width of Chunks/Strips
        progressBar?.progressTintColor = .primaryColor  // To change the Chunks color
        progressBar?.trackTintColor = UIColor.darkGray  // To change background color of loading indicator
    }
    
    func hideNavigationBar(_ shouldHide: Bool = true) {
        navigationController?.navigationBar.isHidden = shouldHide
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    
    private func setObservers() {
        observeLoadingState()
        observeErrorState()
        observeAlertMessages()
        setChildViewControllerObservers()
    }
    
    func setChildViewControllerObservers() {}
    
    /// Observes Alert Messages
    private func observeAlertMessages() {
        kViewModel.alertMessage.asObservable().bind { [weak self] value in
            self?.showAlert(message: value.message, type: value.type)
        }.disposed(by: disposeBag)
    }
    
    /// Observer for showing or hiding loading animations on the UI
    private func observeLoadingState() {
        kViewModel.isLoading.asObservable().bind { [weak self] value in
            if value {
                self?.showLoading()
            } else {
                self?.hideLoading()
            }
        }.disposed(by: disposeBag)
    }
    
    /// Observers error messages
    private func observeErrorState() {
        kViewModel.error.asObserver().bind { [weak self] error in
            let message = (error as NSError).code == 13 ? "It appears you're offline, please check your internet connection and try again!" : error.localizedDescription
            self?.showAlert(message: message, type: .error)
        }.disposed(by: disposeBag)
    }
    
    func showLoading() {
        //enableSwipeBackToPopGesture(false)
        hideLoading()
        createHorizontalProgressBar()
        progressBar?.startAnimating()
        disableNavBar()
        views.disableUserInteraction()
    }
    
    func hideLoading() {
        //enableSwipeBackToPopGesture()
        progressBar?.stopAnimating()
        enableNavBar()
        views.enableUserInteraction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        kViewModel.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideAlert()
        kViewModel.viewWillDisappear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hideAlert()
        kViewModel.viewDidAppear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        hideAlert()
        kViewModel.viewDidDisappear()
    }

}
