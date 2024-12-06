//
//  CustomPDFView.swift
//  SystemsImpacts
//
//  Created by Carson Angell on 9/20/24.
//

import SwiftUI
import PDFKit

struct CustomPDFView: View {
    let displayedPDFUrl : URL
    var body: some View {
        PDFKitRepresentedView(documentURL: displayedPDFUrl)
            .ignoresSafeArea(.all)
            .accessibilityLabel("PDF of researched definitions")
            .accessibilityValue("Definitions and examples of Computer Systems, Networks, and other related words.")
    }
}

struct PDFKitRepresentedView : UIViewRepresentable {
    var documentURL : URL
    
    init (documentURL : URL){
        self.documentURL = documentURL
    }
    
    func makeUIView(context : Context) -> some UIView {
        let pdfView : PDFView = PDFView()
        pdfView.document = PDFDocument(url: self.documentURL)
        pdfView.displayDirection = .vertical
        pdfView.scaleFactor = 0.5
        
        return pdfView
    }
    
    func updateUIView(_ uiView : UIViewType, context: Context) -> Void {
        //No Code Inside Here!
    }
}

#Preview ("CustomPDFView"){
    CustomPDFView(displayedPDFUrl: haikuDocument)
}
