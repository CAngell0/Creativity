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
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    Section("Haikus", isExpanded: $isShowingHaikus) {
                        ForEach(loadHaikus()){ haiku in
                            NavigationLink(haiku.title, destination: ArtifactView(artifact: haiku))
                        }
                    }
                    Section("Artwork Pieces", isExpanded: $isShowingArtworks) {
                        ForEach(loadArtworks()){ artwork in
                            NavigationLink(artwork.title, destination: ArtifactView(artifact: artwork))
                        }
                    }
                    Section("Drawings", isExpanded: $isShowingDrawings) {
                        NavigationLink("Turtle Drawing", destination: TurtleView())
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
