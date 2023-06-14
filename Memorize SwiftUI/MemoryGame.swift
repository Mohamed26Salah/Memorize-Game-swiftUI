//
//  MemoryGame.swift
//  Memorize SwiftUI
//
//  Created by Mohamed Salah on 10/03/2023.
//

import Foundation
//Generic
//lma enta bt3rfoh enta bt7dd no3oh
struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly}
        set {cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}}
//
//        set {
//            //We could do $0
//            cards.indices.forEach({index in
//                cards[index].isFaceUp = (index == newValue)
//            })
//        }
    }
    
    mutating func choose(_ card: Card) {
//        let chosedIndex = card.id
        //law 3mlt keda wa enta fe struct fa enta kda btcoppy
        //        var chosenCard = cards[chosedIndex]
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentailMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentailMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentailMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
        
    }
    mutating func shuffle() {
        cards.shuffle()
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
//        cards = Array<Card>()
        //add numberofpairs of cards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}
extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
