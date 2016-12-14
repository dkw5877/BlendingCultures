//
//  HandDataSource.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

class HandDataSource: DataSource {


    init() {
        super.init(dataObject:Hand())
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardCell,

            let hand = dataObject as? Hand else { fatalError("Could not create CardCell") }

        cell.fillWith(card: hand[indexPath.row])
        return cell
        
    }

    override var conditionForAdding: Bool {
        return dataObject.numberOfItems < 5
    }
}
