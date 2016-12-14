//
//  SourceType.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

protocol SourceType: UITableViewDataSource {

    /* define the protocol methods */
    func insertTopRowIn(tableView:UITableView)
    func deleteRowAtIndexPath(indexPath:IndexPath, from tableView:UITableView)

}


/* implement methods in an extension */
extension SourceType {

    func insertTopRowIn(tableView:UITableView) {
        tableView.insertRows(at: [IndexPath(row:0, section:0)], with: .fade)
    }

    func deleteRowAtIndexPath(indexPath:IndexPath, from tableView:UITableView) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

}
