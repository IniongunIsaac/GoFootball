//
//  BaseViewModel.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

/// Application-wide BaseViewModel.
/// Abstracts common ViewModel functionalities such as performing custom `Observable` subscriptions,
/// emitting error and loading states.

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    
    let isLoading: PublishSubject<Bool> = PublishSubject()
    
    let alertMessage: PublishSubject<AlertMessage> = PublishSubject()
    
    let error: PublishSubject<Error> = PublishSubject()
    
    func viewDidLoad() {}
    
    func viewWillAppear() {}
    
    func viewDidAppear() {}
    
    func viewWillDisappear() {}
    
    func viewDidDisappear() {}
    
    /// Function to emit `false` loading state i.e hide the loading animation. Also emits an error state.
    /// - Parameter error: error to be emitted.
    func emitFalseLoadingAndErrorValues(error: Error) {
        isLoading.onNext(false)
        self.error.onNext(error)
    }
    
    /// Function to emit loading state on the UI
    /// - Parameter show: determines whether to show or hide the loading animation
    func showLoading(_ show: Bool = true) {
        isLoading.onNext(show)
    }
    
    
    /// Function to emit feedback messages on the UI
    /// - Parameters:
    ///   - message: feedback to be displayed to the user
    ///   - type: determines message type: sucess, error or warning
    func showMessage(_ message: String, type: AlertType = .success) {
        alertMessage.onNext(AlertMessage(message: message, type: type))
    }
    
    /// This function subscribes any observable of type `T`
    /// - Parameters:
    ///   - observable: observable to be subscribed. Has a generic type `T`
    ///   - showLoadingAnimation: determines whether or not a loading animation is shown on the UI
    ///   - showMessageAlerts: determines whether or not success/error messages should be shown on the UI
    ///   - errorMessage: custom error message to be shown in times of error
    ///   - success: success completion handler. Recieves value of type `T`
    ///   - error: error completion handler. Receives `Error`
    func subscribeAny<T>(_ observable: Observable<T>, showLoadingAnimation: Bool = true, showMessageAlerts: Bool = true, errorMessage: String? = nil, success: ((T) -> Void)? = nil, error: ((Error) -> Void)? = nil) {
        showLoading(showLoadingAnimation)
        observable.subscribe(onNext: { [weak self] value in
            self?.showLoading(false)
            success?(value)
        }, onError: { [weak self] err in
            self?.showLoading(false)
            
            if showMessageAlerts {
                if let errorMessage = errorMessage {
                    self?.showMessage(errorMessage, type: .error)
                }
                if let error = error {
                    error(err)
                } else {
                    self?.emitFalseLoadingAndErrorValues(error: err)
                }
            }
            
        }).disposed(by: disposeBag)
    }
    
}
