//
//  ViewController.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

class HandViewController: UITableViewController {

    private var hand = Hand(deck: Deck(), cards: [Card]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func addNewCard(sender:UIBarButtonItem) {
    if hand.numberOfCards < 5 {
        hand  = hand.addNewCartAtIndex(index: 0)
        insertTopRow()
    }
    }

    private func insertTopRow() {
        tableView.insertRows(at: [IndexPath(row:0, section:0)], with: .fade)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfCards
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardCell else { fatalError("Could not create CardCell") }
        cell.fillWith(card: hand[indexPath.row])
        return cell

    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            hand = hand.deleteCardAtIndex(index:indexPath.row)
            deleteRowAtIndexPath(indexPath: indexPath)
        }
    }

    private func deleteRowAtIndexPath(indexPath:IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        hand = hand.moveCard(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
}

