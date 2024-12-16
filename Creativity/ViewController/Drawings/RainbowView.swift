//
//  Rainbow View.swift
//  Creativity
//
//  Created by Carson Angell on 12/16/24.
//

import SwiftUI

struct RainbowView: View {
    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .ignoresSafeArea()
            VStack {
                PrideFlag(width: 75, height: 50)
                PrideFlag()
                Text("Computer Science is for everyone")
                    .gradientForeground(gradientColors: [.green, .gray, .blue, makeBlueShade(), .red])
            }
        }
    }
}

struct Triangle : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct PrideFlag : View {
    var width : CGFloat = 300
    var height : CGFloat = 200
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(createPrideGradient())
                .frame(width: width, height: height, alignment: .center)
            Triangle()
                .fill(transInclusive(height: height))
                .frame(width: width, height: height, alignment: .center)
        }
    }
}

#Preview ("Rainbow View"){
    RainbowView()
}
