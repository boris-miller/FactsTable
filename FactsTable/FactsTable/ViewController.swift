//
//  ViewController.swift
//  FactsTable
//
//  Created by Boris Miller on 5/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var service = Service()

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }
    
    private func reloadData()  {
        service.retrieve { (welcome, error) in
            debugPrint("***Welcome:\n\(String(describing: welcome))\n\n***Error:\n\(String(describing: error))")
        }
    }

}
