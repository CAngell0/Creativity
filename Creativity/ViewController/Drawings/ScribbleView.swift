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
        let scribble = Path()
        
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
