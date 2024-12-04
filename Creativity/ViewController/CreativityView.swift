//
//  ContentView.swift
//  Creativity
//
//  Created by Carson Angell on 12/2/24.
//

import SwiftUI

struct CreativityView: View {
    let artifacts : [Artifact] = loadArtworks()
    
    @State private var isShowingArtifacts : Bool = false
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    Section("Artifacts", isExpanded: $isShowingArtifacts) {
                        ForEach(artifacts){ artifact in
                            NavigationLink(artifact.title, destination: ArtifactView(artifact: artifact))
                        }
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
