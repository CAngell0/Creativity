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
            MultiBasicShape()
                .stroke(style: StrokeStyle(lineWidth: 2))
            MultiComplexShape()
                .stroke(style: StrokeStyle(lineWidth: 2))
            MultiSimpleShape()
                .stroke(style: StrokeStyle(lineWidth: 2))
            
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

struct MultiBasicShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for _ in 1...3 {
            let pos = CGPoint(
                x: Int(arc4random()) % Int(rect.maxX),
                y: Int(arc4random()) % Int(rect.maxY)
            )
            path.addPath(makeBasicShape(in: rect, position: pos))
        }
        
        for _ in 1...3 {
            let pos = CGPoint(
                x: Int(arc4random()) % Int(rect.maxX),
                y: Int(arc4random()) % Int(rect.maxY)
            )
            path.addPath(makeMirroredBasicShape(in: rect, position: pos))
        }
        
        return path
    }
    
    func makeBasicShape(in rect: CGRect, position pos: CGPoint) -> Path {
        var path = Path()
        var xPos = pos.x
        var yPos = pos.y
        
        path.move(to: CGPoint(x: xPos, y: yPos))
        xPos += 70
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 20
        
        
        path.addArc(
            center: CGPoint(x: xPos, y: yPos),
            radius: 20,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: -90),
            clockwise: true
        )
        xPos -= 30
        yPos -= 20
        
        path.addArc(
            center: CGPoint(x: xPos, y: yPos),
            radius: 30,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: -45),
            clockwise: true
        )
        xPos += 20
        yPos -= 20
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 10
        yPos += 10
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 10
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        path.addArc(
            center: CGPoint(x: xPos, y: yPos),
            radius: 10,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 135),
            clockwise: true
        )
        
        path.closeSubpath()
        return path
    }
    
    func makeMirroredBasicShape(in rect: CGRect, position pos: CGPoint) -> Path {
        return verticalMirror(of: makeBasicShape(in: rect, position: pos), in: rect)
    }
}

struct MultiComplexShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for _ in 1...3 {
            let pos = CGPoint(
                x: Int(arc4random()) % Int(rect.maxX),
                y: Int(arc4random()) % Int(rect.maxY)
            )
            path.addPath(makeComplexShape(in: rect, position: pos))
        }
        for _ in 1...3 {
            let pos = CGPoint(
                x: Int(arc4random()) % Int(rect.maxX),
                y: Int(arc4random()) % Int(rect.maxY)
            )
            path.addPath(makeMirroredComplexShape(in: rect, position: pos))
        }
        
        return path
    }
    
    func makeComplexShape(in rect: CGRect, position pos: CGPoint) -> Path {
        var path = Path()
        
        var xPos = pos.x
        var yPos = pos.y
        
        path.move(to: CGPoint(x: xPos, y: yPos))
        xPos += 30
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 20
        yPos -= 20
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        yPos -= 30
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 30
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 20
        yPos += 20
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        yPos += 30
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 20
        yPos -= 20
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 10
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        yPos -= 10
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 10
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        yPos += 10
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 20
        yPos += 20
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 30
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        yPos -= 30
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 20
        yPos -= 20
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 20
        yPos += 20
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 30
        
        path.addLine(to: CGPoint(x: xPos, y: yPos))
        
        path.closeSubpath()
        
        return path
    }
    
    func makeMirroredComplexShape(in rect: CGRect, position pos: CGPoint) -> Path {
        return verticalMirror(of: makeComplexShape(in: rect, position: pos), in: rect)
    }
}

struct MultiSimpleShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for _ in 1...3 {
            let pos = CGPoint(
                x: Int(arc4random()) % Int(rect.maxX),
                y: Int(arc4random()) % Int(rect.maxY)
            )
            path.addPath(makeSimpleShape(in: rect, position: pos))
        }
        for _ in 1...3 {
            let pos = CGPoint(
                x: Int(arc4random()) % Int(rect.maxX),
                y: Int(arc4random()) % Int(rect.maxY)
            )
            path.addPath(makeMirroredSimpleShape(in: rect, position: pos))
        }
        
        return path
    }
    
    func makeSimpleShape(in rect: CGRect, position pos : CGPoint) -> Path {
        var returnPath = Path()
        var firstPath = Path()
        var secondPath = Path()
        
        var xPos = pos.x + 5
        var yPos = pos.y + 5
        
        firstPath.move(to: CGPoint(x: xPos, y: yPos))
        xPos += 30

        firstPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 20
        yPos += 30
        
        firstPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 20
        
        firstPath.addArc(
            center: CGPoint(x: xPos, y: yPos),
            radius: 20,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )
        yPos += 20
        
        firstPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 30
        yPos -= 20
        
        firstPath.addLine(to: CGPoint(x: xPos, y: yPos))
        firstPath.closeSubpath()
        
        xPos = pos.x + 50
        yPos = pos.y + 50
        
        secondPath.move(to: CGPoint(x: xPos, y: yPos))
        xPos += 30
        
        secondPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos -= 15
        yPos += 15
        
        secondPath.addArc(
            center: CGPoint(x: xPos, y: yPos),
            radius: 21.5,
            startAngle: Angle(degrees: 315),
            endAngle: Angle(degrees: 225),
            clockwise: true
        )
        xPos = pos.x + 50
        yPos = pos.y + 80
        
        secondPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 15
        yPos -= 15
        
        secondPath.addArc(
            center: CGPoint(x: xPos, y: yPos),
            radius: 21.5,
            startAngle: Angle(degrees: 225),
            endAngle: Angle(degrees: 135),
            clockwise: true
        )
        
        secondPath.closeSubpath()
        
        
        returnPath.addPath(firstPath)
        returnPath.addPath(secondPath)
        
        return returnPath
    }
    
    func makeMirroredSimpleShape(in rect: CGRect, position pos: CGPoint) -> Path {
        return verticalMirror(of: makeSimpleShape(in: rect, position: pos), in: rect)
    }
}

#Preview ("Bob Ross View"){
    BobRossView()
}
