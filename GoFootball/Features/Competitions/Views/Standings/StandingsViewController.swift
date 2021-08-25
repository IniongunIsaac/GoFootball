//
//  StandingsViewController.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit
import RxSwift

class StandingsViewController: UIViewController {

    @IBOutlet weak var standingsTableView: UITableView!
    
    var standings = [Table]()
    fileprivate let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStandingsTableView()
    }
    
    fileprivate func setupStandingsTableView() {
        standings.asObservable.map({ $0.isEmpty }).distinctUntilChanged().bind(to: standingsTableView.rx.isEmpty(message: "Standings will be shown here!")).disposed(by: disposeBag)
        standings.asObservable.bind(to: standingsTableView.rx.items(cellIdentifier: R.reuseIdentifier.standingTableViewCell.identifier, cellType: StandingTableViewCell.self)) { index, item, cell in
            
            cell.configureView(table: item)
            
            cell.animateViewOnTapGesture {}
            
        }.disposed(by: disposeBag)
    }

}
