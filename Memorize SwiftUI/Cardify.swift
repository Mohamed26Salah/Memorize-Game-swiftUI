//
//  Cardify.swift
//  Memorize SwiftUI
//
//  Created by Mohamed Salah on 14/03/2023.
//

import SwiftUI
//viewModifier
struct Cardify: Animatable, ViewModifier {
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    var animatableData: Double {
        get{rotation}
        set{rotation = newValue}
        //By Doing this you stop the default animations of the viewModifiers that its value changes like fill and opacity
        //Now you are doing the animations by your self becasue you are follwing each change in the rotaion and update
        //"Animate my data for me and I will figure out what to do"
    }
    var rotation: Double
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstsants.cornerRadius)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstsants.lineWidth)
            } else {
                shape.fill()
            }
            content.opacity(rotation < 90 ? 1 : 0 )
            //fix for implicit one card only animates, now contnet dymn mawgooda 2bl ma 2y 7aga tt8yar 2sln
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
    private struct DrawingConstsants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}
extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
