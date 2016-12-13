//
//  Hand.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

struct Hand {

    private let deck = Deck()
    private var cards = [Card]()
    var numberOfCards:Int {
        return cards.count
    }


    mutating func addNewCartAtIndex(index:Int) {
        insertCard(card: deck.nextCard(), atIndex: index)
    }

    mutating private func insertCard(card:Card, atIndex index:Int) {
        cards.insert(card, at: index)
    }

    mutating func cardAtPosition(index:Int) -> Card {
        return cards[index]
    }

    mutating func deleteCardAtIndex(index:Int) {
        cards.remove(at: index)
    }

    mutating func moveCard(fromIndex:Int, toIndex:Int) {
        let cardToMove =  cards[fromIndex]
        deleteCardAtIndex(index: fromIndex)
        insertCard(card: cardToMove, atIndex: toIndex)
    }
    
}
