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
                    .font(.title)
                    .accessibilityLabel("Artifact Title")
                    .accessibilityValue(artifact.title)
                Image(artifact.fileName)
                    .resizable()
                    .scaledToFit()
                    .accessibilityLabel("Artifact Image")
                Text(artifact.description)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .accessibilityLabel("Artifact Description")
                    .accessibilityValue(artifact.description)
            }
        }
    }
}

#Preview ("Displayes an artifact"){
    ArtifactView(artifact: sampleArtifact)
}
