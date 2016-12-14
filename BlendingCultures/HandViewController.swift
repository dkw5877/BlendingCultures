//
//  ViewController.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

class HandViewController: UITableViewController {

    private var dataSource = DataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }

    @IBAction private func addNewCard(sender:UIBarButtonItem) {
        dataSource.addItemTo(tableView: tableView)
    }

}

