//
//  Memorize_SwiftUIApp.swift
//  Memorize SwiftUI
//
//  Created by Mohamed Salah on 09/03/2023.
//

import SwiftUI

@main
struct Memorize_SwiftUIApp: App {
   private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
//Why I used let, even iam going to change
//Because this is a class this is just a pointer
//Iam not going to change this pointer(game), but iam going to change what it points to (EMojiMemoryGame())
