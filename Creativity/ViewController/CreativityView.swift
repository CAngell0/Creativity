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
                    Section("Documents", isExpanded: $isShowingDocuments) {
                        NavigationLink("Haiku Poems", destination: CustomPDFView(displayedPDFUrl: documents.Haiku))
                            .accessibilityLabel("Link to Haiki Poems")
                            .accessibilityValue("Haiku Poems")
                        NavigationLink("Swift Code Review", destination: CustomPDFView(displayedPDFUrl: documents.CodeReview))
                            .accessibilityLabel("Link to Swift Code Review")
                            .accessibilityValue("Swift Code Review")
                        NavigationLink("Custom Drawing Worksheet", destination: CustomPDFView(displayedPDFUrl: documents.DrawingWorksheet))
                            .accessibilityLabel("Link to Custom Drawing Worksheet")
                            .accessibilityValue("Custom Drawing Worksheet")
                        NavigationLink("Shade Work Document", destination: CustomPDFView(displayedPDFUrl: documents.ShadeWork))
                            .accessibilityLabel("Link to Shade Work Document")
                            .accessibilityValue("Shade Work Document")
                        NavigationLink("Written Responses", destination: CustomPDFView(displayedPDFUrl: documents.WrittenResponses))
                            .accessibilityLabel("Link to Written Responses")
                            .accessibilityValue("Written Responses")
                    }
                }
                .listStyle(SidebarListStyle())
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Creativity")
                            .font(.largeTitle)
                            .gradientForeground(gradientColors: [.red, .gray, .blue])
                    }
                }
            }
        }
    }
}

#Preview {
    CreativityView()
}
