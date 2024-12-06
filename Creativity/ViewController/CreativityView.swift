//
//  ContentView.swift
//  Creativity
//
//  Created by Carson Angell on 12/2/24.
//

import SwiftUI

struct CreativityView: View {
    let artifacts : [Artifact] = loadArtworks()
    
    @State private var isShowingHaikus : Bool = false
    @State private var isShowingArtworks : Bool = false
    @State private var isShowingDrawings : Bool = false
    @State private var isShowingDocuments : Bool = false
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    Section("Haikus", isExpanded: $isShowingHaikus) {
                        ForEach(loadHaikus()){ haiku in
                            NavigationLink(haiku.title, destination: ArtifactView(artifact: haiku))
                                .accessibilityLabel("Link for \(haiku.title)")
                                .accessibilityValue(haiku.title)
                        }
                    }
                    Section("Artwork Pieces", isExpanded: $isShowingArtworks) {
                        ForEach(loadArtworks()){ artwork in
                            NavigationLink(artwork.title, destination: ArtifactView(artifact: artwork))
                                .accessibilityLabel("Link for \(artwork.title)")
                                .accessibilityValue(artwork.title)
                        }
                    }
                    Section("Drawings", isExpanded: $isShowingDrawings) {
                        NavigationLink("Turtle Drawing", destination: TurtleView())
                            .accessibilityLabel("Link to turtlem drawing")
                            .accessibilityValue("Turtle Drawing")
                    }
                }
                .listStyle(.sidebar)
            }
        }
        .padding()
    }
}

#Preview {
    CreativityView()
}
