//
//  SpirographView.swift
//  Creativity
//
//  Created by Carson Angell on 12/12/24.
//

import SwiftUI

struct SpirographView: View {
    var body: some View {
        Spirograph()
            .stroke(style: StrokeStyle(lineWidth: 1))
    }
}

struct Spirograph : Shape {
    var scalar : Double = 20.0
    var increment : Double = 0.5
    var repetitions : Double = 360.0
    var smallRadius : Double = 10.0
    var largeRadius : Double = 17
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        var currentX = Double(rect.midX)
        var currentY = Double(rect.midY)
        
        path.move(to: CGPoint(x: currentX, y: currentY))
        
        for theta in stride(from: 0.0, to: repetitions, by: increment){
            let deltaX = cos(theta) * (largeRadius - smallRadius) + scalar * cos((smallRadius - largeRadius) * (theta / smallRadius))
            let deltaY = sin(theta) * (largeRadius - smallRadius) + scalar * sin((smallRadius - largeRadius) * (theta / smallRadius))
            
            currentX += deltaX
            currentY += deltaY
            
            path.addLine(to: CGPoint(x: currentX, y: currentY))
        }
        
        return path
    }
}

#Preview ("Spirograph View"){
    SpirographView()
}
