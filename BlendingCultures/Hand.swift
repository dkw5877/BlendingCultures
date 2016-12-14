//
//  Hand.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

struct Hand {

    private var deck = Deck()
    private var cards = [Card]()
    var numberOfCards:Int {
        return cards.count
    }

    init(deck:Deck, cards:[Card]) {
        self.deck = deck
        self.cards = cards
    }

    subscript(index:Int) -> Card {
        return cards[index]
    }

    func addNewCartAtIndex(index:Int) -> Hand {
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

    func deleteCardAtIndex(index:Int) -> Hand {
        var mutableCards = cards
        mutableCards.remove(at: index)
        return Hand(deck: deck, cards: mutableCards)
    }

    func moveCard(fromIndex:Int, toIndex:Int) -> Hand {
        return deleteCardAtIndex(index: fromIndex).insertCard(card: cards[fromIndex], atIndex: toIndex)
    }
    
}
