//
//  Artifact.swift
//  Creativity
//
//  Created by Carson Angell on 12/2/24.
//

import Foundation

struct Artifact : Identifiable {
    let id : UUID = UUID()
    let fileName : String
    let title : String
    let description: String
}
