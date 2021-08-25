//
//  CompetitionMatchesViewController.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit
import RxSwift

class CompetitionMatchesViewController: UIViewController {
    
    @IBOutlet weak var matchesTableView: UITableView!
    
    var matches = [Match]()
    fileprivate let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMatchesTableView()
    }
    
    fileprivate func setupMatchesTableView() {
        matches.asObservable.map({ $0.isEmpty }).distinctUntilChanged().bind(to: matchesTableView.rx.isEmpty(message: "Matches will be shown here!")).disposed(by: disposeBag)
        matches.asObservable.bind(to: matchesTableView.rx.items(cellIdentifier: R.reuseIdentifier.competitionMatchTableViewCell.identifier, cellType: MatchTableViewCell.self)) { index, item, cell in
            
            cell.matchView.setup(with: item)
            
            cell.animateViewOnTapGesture {}
            
        }.disposed(by: disposeBag)
    }

}
