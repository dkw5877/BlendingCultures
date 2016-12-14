//
//  DataSourec.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, SourceType {

    var dataObject:DataType = Hand()
    var conditionForAdding:Bool { return false }

    init<A: DataType>(dataObject:A) {
        self.dataObject = dataObject
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("This method must be overridden")
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataObject = dataObject.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }

}
