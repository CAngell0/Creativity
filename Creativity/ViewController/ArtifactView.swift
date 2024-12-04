//
//  ArtifactView.swift
//  Creativity
//
//  Created by Carson Angell on 12/4/24.
//

import SwiftUI

struct ArtifactView: View {
    let artifact : Artifact
    var body: some View {
        ZStack {
            VStack {
                Text(artifact.title)
                    .font(.headline)
                Spacer()
                Image(artifact.fileName)
                    .resizable()
                    .scaledToFit()
                Text(artifact.description)
                    .font(.caption2)
            }
        }
    }
}

#Preview ("Displayes an artifact"){
    ArtifactView(artifact: sampleArtifact)
}
