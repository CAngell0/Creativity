//
//  Utilites.swift
//  Creativity
//
//  Created by Carson Angell on 12/2/24.
//

import Foundation
import SwiftUI

//MARK: - URL's for documents

let haikuDocument = Bundle.main.url(forResource: "Haikus", withExtension: "pdf")!

//MARK: - Sample Artifact

let sampleArtifact = Artifact(fileName: "Carson - Demo", title: "Mountain Artwork", description: "A piece of artwork I created a year ago.")

//MARK: - Load Haiku and Art artifacts
//TODO: - Finish this method with all the artifacts

func loadArtworks() -> [Artifact] {
    let artworks : [Artifact] = [
        Artifact(fileName: "Mountain PolyArt", title: "Mountain Low-Poly Artwork", description: "A piece of artwork I designed for my home school library to put up. It uses small triangles/polygons of different color to create the image."),
        Artifact(fileName: "Blue Waves", title: "BlueWaves Artwork", description: ""),
        Artifact(fileName: "GraphicEye", title: "Graphic Eye Artwork", description: "")
    ]
    return artworks
}

func loadHaikus() -> [Artifact] {
    let haikus : [Artifact] = [
        Artifact(fileName: "Swift Haiku", title: "Swift Haiku Writing", description: ""),
        Artifact(fileName: "Java Haiku", title: "Java Haiku Writing", description: ""),
        Artifact(fileName: "CompSci Haiku", title: "CompSci Haiku Writing", description: "")
    ]
    return haikus
}

//MARK: - Custom Color Section
let blue : Color = Color(red: (66.0 / 255.0), green: (144.0 / 255.0), blue: (245.0 / 255.0))

func makeBlueShade() -> Color {
    
    let redPercent = Double((Int(arc4random()) % 132) + 2) / 255.0
    let greenPercent = Double((Int(arc4random()) % 101) + 73) / 255.0
    let bluePercent = Double((Int(arc4random()) % 59) + 168) / 255.0
    
    return Color(red: redPercent, green: greenPercent, blue: bluePercent)
}


//MARK: - Mirroring

/// Creates a vertical mirror transformation of a supplied path.
/// Uses Affine transformation to accomplish this.
/// - Parameters:
///   - path: Path to mirror
///   - rect: The bounds to reflect in
/// - Returns: The reflected path in the supplied bounds
func verticalMirror(of path : Path, in rect: CGRect) -> Path {
    var mirroredPath = Path()
    
    mirroredPath.addPath(path)
    
    mirroredPath = mirroredPath.applying(CGAffineTransform(translationX: -rect.origin.x, y: 0))
    mirroredPath = mirroredPath.applying(CGAffineTransform(scaleX: -1, y: 1))
    mirroredPath = mirroredPath.applying(CGAffineTransform(translationX: rect.origin.x + rect.width, y: 0))
    
    return mirroredPath
}

/// Creates a horizontal mirror transformation of a supplied path.
/// Uses Affine tansformation to accomplish this
/// - Parameters:
///   - path: Path to mirror
///   - rect: The bounds to reflect in
/// - Returns: The reflected path in the supplied bounds
func horizontalMirror(of path : Path, in rect : CGRect) -> Path {
    var mirroredPath = Path()
    
    mirroredPath.addPath(path);
    
    mirroredPath = mirroredPath.applying(CGAffineTransform(translationX: 0, y: -rect.origin.y))
    mirroredPath = mirroredPath.applying(CGAffineTransform(scaleX: 1, y: -1))
    mirroredPath = mirroredPath.applying(CGAffineTransform(translationX: 0, y: rect.origin.y + rect.height))
    
    return mirroredPath
}

//MARK: - Inclusive Gradients

func createPrideGradient() -> LinearGradient {
    let prideColors : [Color] = [.red, .red, .orange, .yellow, .green, .blue, .purple, .purple]
    let gradient = LinearGradient(gradient: Gradient(colors: prideColors), startPoint: .top, endPoint: .bottom)
    return gradient
}

func transInclusive(height : CGFloat) -> RadialGradient {
    let colors = Gradient(colors: [.white, .red, .pink,.blue, Color(UIColor(red: 163 / 255, green: 133 / 255, blue: 51 / 255, alpha: 0.9)), .black, .black])
    let conic = RadialGradient(gradient: colors, center: .leading, startRadius: 1, endRadius: height / 2)
    return conic
}

//MARK: - Adding functionaliy to View
//TODO: - Add this to notes

extension View {
    public func gradientForeground(gradientColors : [Color]) -> some View {
        self.overlay(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
