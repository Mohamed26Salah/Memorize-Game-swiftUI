//
//  EmojiMemoryGame.swift
//  Memorize SwiftUI
//
//  Created by Mohamed Salah on 10/03/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["💦","😶‍🌫️","🤫","🫴","😒","❤️","👿","😶","🤑","💀","🤠","😈","🦀","🐫","🕸️","🕷️","🦖","🐞","🍞","🍕"]
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairindex in emojis[pairindex] }
    }
    @Published private var model = createMemoryGame()
    //Can Detect changes in a struct
    var cards: Array<Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card:Card){
        //Any Time you will change your model
//        objectWillChange.send()
        model.choose(card)
    }
    func shuffle() {
        model.shuffle()
    }
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}

//7awel daymn mtzhrsh elmodel fe elview just the viewModel

//Closures are portals to transfer a data in a function to another dimesntion or a function
//that can do whatever it wants with it, it even also can use the function and the inside of the function can make it change from the place the function came from

//hwa literally byb3ltk function e3ml elnfsk fee

//Clousres is esm el7aga, lakn fe el7akekea anabb3tlk type function
