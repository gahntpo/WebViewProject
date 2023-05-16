//
//  ReadingListViewModel.swift
//  WebViewProject
//
//  Created by Karin Prater on 16.05.23.
//

import SwiftUI

import Foundation

class ReadingListViewModel: ObservableObject {
    @Published var urls: [URL] = []

    private var fileURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("readingList.json")
    }

    init() {
        load()
    }

    func add(_ url: URL) {
        urls.append(url)
        save()
    }

    func remove(_ url: URL) {
        if let index = urls.firstIndex(of: url) {
            urls.remove(at: index)
            save()
        }
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(urls)
            try data.write(to: fileURL)
        } catch {
            print("Error saving reading list: \(error)")
        }
    }

    private func load() {
        do {
            let data = try Data(contentsOf: fileURL)
            urls = try JSONDecoder().decode([URL].self, from: data)
        } catch {
            print("Error loading reading list: \(error)")
        }
    }
}
