//
//  ViewController.swift
//  FactsTable
//
//  Created by Boris Miller on 5/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private static let estimatedRowHeight: CGFloat = 60
    private lazy var service = Service()
    private let cellId = "RowCellId"
    
    private var welcome: Welcome? {
        didSet {
            updateTitle()
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        tableView.register(RowCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Self.estimatedRowHeight

        // Add Refresh Control to Table View
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        
        refreshControl?.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RowCell
        let currentLastItem = welcome?.rows[indexPath.row]
        cell.row = currentLastItem
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return welcome?.rows.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc private func refreshData(_ sender: Any) {
        debugPrint("refresh data\n")
        reloadData()
    }

    private func updateTitle() {
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
