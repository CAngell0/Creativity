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
