//
//  ScribleView.swift
//  Creativity
//
//  Created by Carson Angell on 12/4/24.
//

import SwiftUI

struct ScribbleView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

#Preview ("Scribble"){
    ScribbleView()
}
