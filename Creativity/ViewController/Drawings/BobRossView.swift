//
//  BobRossView.swift
//  Creativity
//
//  Created by Carson Angell on 12/10/24.
//

import SwiftUI

struct BobRossView: View {
    var body: some View {
        ZStack {
            makeBlueShade()
                .ignoresSafeArea(.all)
            Tree()
                .fill(ImagePaint(image: Image("Small"), scale: 0.8))
                .overlay(Tree().stroke(.green, lineWidth: 10))
        }
    }
}

struct Tree : Shape {
    func path(in rect: CGRect) -> Path {
        var leftPath = Path()
        
        var xPos = rect.midX
        var yPos = rect.minY + 50.5
        
        leftPath.move(to: CGPoint(x: xPos, y: yPos))
        xPos += 1
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 1
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 50
        yPos += 50
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 30
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 70
        yPos += 100
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 30
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 100
        yPos += 200
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 120
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        yPos += 50
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos = rect.midX
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        
        let rightPath = verticalMirror(of: leftPath, in: rect)
        leftPath.addPath(rightPath)
        
        return leftPath
    }
}

#Preview ("Bob Ross View"){
    BobRossView()
}
