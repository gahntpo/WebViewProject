//
//  ReadingDataRow.swift
//  WebViewProject
//
//  Created by Karin Prater on 17.05.23.
//

import SwiftUI

struct ReadingDataRow: View {
    let readingData: ReadingData
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: readingData.hasFinishedReading ? "book.fill" : "book")
                .foregroundColor(.green)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(readingData.title)
                    .bold()
                Text(readingData.creationDate,
                     format: .dateTime.day().month().year())
            }
            Spacer()
           
        }
    }
}

struct ReadingDataRow_Previews: PreviewProvider {
    static var previews: some View {
        ReadingDataRow(readingData: ReadingData.example())
    }
}
