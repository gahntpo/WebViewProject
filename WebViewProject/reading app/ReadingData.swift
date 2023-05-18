//
//  ReadingData.swift
//  WebViewProject
//
//  Created by Karin Prater on 17.05.23.
//

import SwiftUI

struct ReadingData: Codable, Equatable, Identifiable {
    let url: URL?
    let title: String
    let creationDate: Date
    var hasFinishedReading: Bool
    var id: Date { return creationDate }
    
    static func example() -> ReadingData {
        ReadingData(url: URL(string: "https://www.apple.com/"),
                    title: "apple",
                    creationDate: Date(),
                    hasFinishedReading: false)
    }
}
