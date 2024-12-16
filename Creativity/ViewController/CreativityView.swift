//
//  ContentView.swift
//  Creativity
//
//  Created by Carson Angell on 12/2/24.
//

import SwiftUI

struct CreativityView: View {
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
                    Section("Artwork", isExpanded: $isShowingArtworks) {
                        ForEach(loadArtworks()){ artwork in
                            NavigationLink(artwork.title, destination: ArtifactView(artifact: artwork))
                                .accessibilityLabel("Link for \(artwork.title)")
                                .accessibilityValue(artwork.title)
                        }
                    }
                    Section("Drawings", isExpanded: $isShowingDrawings) {
                        NavigationLink("Turtle Drawing", destination: TurtleView())
                            .accessibilityLabel("Link to turtle drawing")
                            .accessibilityValue("Turtle Drawing")
                        NavigationLink("Scribble Drawing 1", destination: ScribbleView())
                            .accessibilityLabel("Link to scribble drawing 1")
                            .accessibilityValue("Scribble Drawing 1")
                        NavigationLink("Scribble Drawing 2", destination: ScribbleView())
                            .accessibilityLabel("Link to scribble drawing 2")
                            .accessibilityValue("Scribble Drawing 2")
                        NavigationLink("Scribble Drawing 3", destination: ScribbleView())
                            .accessibilityLabel("Link to scribble drawing 3")
                            .accessibilityValue("Scribble Drawing 3")
                        NavigationLink("Bob Ross Drawing", destination: BobRossView())
                            .accessibilityLabel("Link to bob ross drawing")
                            .accessibilityValue("Bob Ross Drawing")
                    }
                }
                .listStyle(SidebarListStyle())
            }
        }
    }
}

#Preview {
    CreativityView()
}
