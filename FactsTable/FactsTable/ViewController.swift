//
//  ViewController.swift
//  FactsTable
//
//  Created by Boris Miller on 5/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private lazy var service = Service()
    
    private var welcome: Welcome? {
        didSet {
            updateTitle()
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }

    func updateTitle() {
        DispatchQueue.main.async {
            self.title = self.welcome?.title
        }
    }

    private func reloadData()  {
        service.retrieve { [weak self] (welcome, error) in
            self?.welcome = welcome
            debugPrint("***Welcome:\n\(String(describing: welcome))\n\n***Error:\n\(String(describing: error))")
        }
    }

}
