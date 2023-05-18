//
//  ReadingListViewModel.swift
//  WebViewProject
//
//  Created by Karin Prater on 16.05.23.
//

import Foundation


class ReadingListViewModel: ObservableObject {
    @Published var readingData: [ReadingData] = []

    private var fileURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("readingListData.json")
    }

    init() {
        load()
    }

    func add(_ url: URL, title: String) {
        let new = ReadingData(url: url, title: title, creationDate: Date(), hasFinishedReading: false)
        readingData.append(new)
        save()
    }

    func remove(_ data: ReadingData) {
        if let index = readingData.firstIndex(of: data) {
            readingData.remove(at: index)
            save()
        }
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(readingData)
            try data.write(to: fileURL)
        } catch {
            print("Error saving reading list: \(error)")
        }
    }

    private func load() {
        do {
            let data = try Data(contentsOf: fileURL)
            readingData = try JSONDecoder().decode([ReadingData].self, from: data)
        } catch {
            print("Error loading reading list: \(error)")
        }
    }
}
