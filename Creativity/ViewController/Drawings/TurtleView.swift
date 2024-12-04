//
//  TurtleView.swift
//  Creativity
//
//  Created by Carson Angell on 12/4/24.
//


//
//  TurtleView.swift
//  Creativity
//
//  Created by Carson Angell on 12/4/24.
//

import SwiftUI

struct TurtleView: View {
    var body: some View {
        ZStack {
            Turtle()
                .fill(.green)
            Sun()
                .fill(.yellow)
                .overlay(Sun().stroke(.orange, lineWidth: 10))
        }
    }
}

struct Turtle : Shape {
    func path(in rect : CGRect) -> Path {
        var logoPath = Path()
        
        logoPath.move(to: CGPoint(x: 10, y: 10))
        logoPath.addLine(to: CGPoint(x: 50, y: 50))
        logoPath.addLine(to: CGPoint(x: 10, y: 90))
        logoPath.closeSubpath()
        
        return logoPath
    }
}

struct Sun : Shape {
    func path(in rect: CGRect) -> Path {
        var sunPath = Path()
        
        sunPath.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        sunPath.addArc(
            center: CGPoint(x: rect.maxX, y: rect.minY),
            radius: 150,
            startAngle: Angle(radians: Double.pi / 2),
            endAngle: Angle(radians: Double.pi),
            clockwise: false
        )
        sunPath.closeSubpath()
        
        return sunPath
    }
}

#Preview ("Turtles"){
    TurtleView()
}
