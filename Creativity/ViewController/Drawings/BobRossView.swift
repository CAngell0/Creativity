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
            MultiComplexShape()
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
}




//struct MultiPathDemo : Shape {
//    func path(in rect: CGRect) -> Path {
//        var demoPath = Path()
//        
//        var currentX = Int(arc4random()) % Int(rect.maxX)
//        var currentY = Int(arc4random()) % Int(rect.maxY)
//        var randomAngle = Double(Int(arc4random()) % 360) * (Double.pi / 180)
//        
//        demoPath.move(to: CGPoint(x: currentX, y: currentY))
//        
//        for _ in 1...3 {
//            demoPath.addLine(to: CGPoint(x: currentX, y: currentY + 50))
//            demoPath.addLine(to: CGPoint(x: currentX + 50, y: currentY + 50))
//            demoPath.addLine(to: CGPoint(x: currentX + 50, y:  currentY))
//            demoPath.closeSubpath()
//            
//            
////            demoPath = demoPath.applying(CGAffineTransform(rotationAngle: randomAngle))
//            
//            currentX = Int(arc4random()) % Int(rect.maxX)
//            currentY = Int(arc4random()) % Int(rect.maxY)
//            demoPath.move(to: CGPoint(x: currentX, y: currentY))
//            
//        }
//
//        return demoPath
//    }
//}

#Preview ("Bob Ross View"){
    BobRossView()
}
