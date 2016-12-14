//
//  DataSourec.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {

    private var hand = Hand(deck: Deck(), cards: [Card]())

    func addItemTo(tableView:UITableView) {
        if hand.numberOfCards < 5 {
            hand  = hand.addNewCartAtIndex(index: 0)
            insertTopRow(tableView: tableView)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfCards
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardCell else { fatalError("Could not create CardCell") }
        cell.fillWith(card: hand[indexPath.row])
        return cell

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }

    func deleteRowAtIndexPath(indexPath:IndexPath, from tableView:UITableView) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        hand = hand.moveCard(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }

    private func insertTopRow(tableView:UITableView) {
        tableView.insertRows(at: [IndexPath(row:0, section:0)], with: .fade)
    }
}
