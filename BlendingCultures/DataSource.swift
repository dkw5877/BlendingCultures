//
//  DataSourec.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, SourceType {

    var dataObject:DataType = Hand(deck: Deck(), cards: [Card]())

    func addItemTo(tableView:UITableView) {
        if dataObject.numberOfItems < 5 {
            dataObject  = dataObject.addNewItemAtIndex(index: 0)
            insertTopRowIn(tableView: tableView)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardCell,

        let hand = dataObject as? Hand else { fatalError("Could not create CardCell") }

        cell.fillWith(card: hand[indexPath.row])
        return cell

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataObject = dataObject.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }

}
