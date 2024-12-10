//
//  ScribleView.swift
//  Creativity
//
//  Created by Carson Angell on 12/4/24.
//

import SwiftUI

struct ScribbleView: View {
    let scribbles = [Scribble(), Scribble(), Scribble(), Scribble(), Scribble(), Scribble(), Scribble(), Scribble(), Scribble(), Scribble()]
    let colors : [Color] = [
        Color(white: 0.1),
        Color(white: 0.2),
        Color(white: 0.3),
        Color(white: 0.4),
        Color(white: 0.5),
        Color(red: 0.918, green: 0.323, blue: 0.205),
        Color(red: 0.918, green: 0.323, blue: 0.205)
    ]
    var house = House()
    
    
    var body: some View {
        ZStack {
            ForEach(scribbles.indices, id: \.self) { index in
                let randomColorIndex = Int(arc4random()) % colors.count
                scribbles[index].stroke(colors[randomColorIndex], lineWidth: CGFloat(arc4random() % 3))
            }
            Scribble()
                .stroke(Color(UIColor(white: 1, alpha: 1)))
            House()
                .stroke(.black, lineWidth: 5)
        }
    }
}

struct Scribble : Shape {
    private func drawScribble(within bounds : CGRect) -> Path {
        var scribble = Path()
        
        let startX = Int(arc4random()) % Int(bounds.midX)
        let startY = Int(arc4random()) % Int(bounds.midY)
        
        scribble.move(to: CGPoint(x: startX, y: startY))
        
        for _ in 1...100 {
            let randomX = Int(arc4random()) % Int(bounds.maxX);
            let randomY = Int(arc4random()) % Int(bounds.maxY);
            
            scribble.addLine(to: CGPoint(x: randomX, y: randomY))
        }
        
        scribble.closeSubpath()
        
        return scribble
    }
    
    func path(in rect: CGRect) -> Path {
        let path = drawScribble(within: rect)
        
        return path
    }
}

struct House : Shape {
    func path(in rect: CGRect) -> Path {
        var housePath = Path()
        
        housePath.move(to: CGPoint(x: rect.maxX - 100, y: rect.maxY - 100))
        housePath.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 100))
        housePath.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 150))
        housePath.addLine(to: CGPoint(x: rect.maxX - 45, y: rect.maxY - 175))
        housePath.addLine(to: CGPoint(x: rect.maxX - 100, y: rect.maxY - 150))
        
        housePath.closeSubpath()
        
        return housePath
    }
}

#Preview ("Scribble"){
    ScribbleView()
}
