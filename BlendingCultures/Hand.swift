//
//  Hand.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

struct Hand: DataType {

    private var deck = Deck()
    private var cards = [Card]()
    var numberOfItems:Int {
        return cards.count
    }

    init() {

    }

    private init(deck:Deck, cards:[Card]) {
        self.deck = deck
        self.cards = cards
    }

    subscript(index:Int) -> Card {
        return cards[index]
    }

    func addNewItemAtIndex(index:Int) -> Hand {
       return insertCard(card: deck.nextCard(), atIndex: index)
    }

    private func insertCard(card:Card, atIndex index:Int) -> Hand {
        var mutableCards = cards
        mutableCards.insert(card, at: index)
        return Hand(deck: deck, cards: mutableCards)
    }

    func cardAtPosition(index:Int) -> Card {
        return cards[index]
    }

    func deleteItemAtIndex(index:Int) -> Hand {
        var mutableCards = cards
        mutableCards.remove(at: index)
        return Hand(deck: deck, cards: mutableCards)
    }

    func moveItem(fromIndex:Int, toIndex:Int) -> Hand {
        return deleteItemAtIndex(index: fromIndex).insertCard(card: cards[fromIndex], atIndex: toIndex)
    }
    
}
