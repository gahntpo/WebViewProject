//
//  NavigationWebView.swift
//  WebViewProject
//
//  Created by Karin Prater on 15.05.23.
//

import SwiftUI

struct ReadingListView: View {
    
    @StateObject var readingViewModel = ReadingListViewModel()
    @State var showReadingDataEditor = false
    @State var selectedURL: URL?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(readingViewModel.readingData) { data in
                    NavigationLink(destination: ReadingDetailView(readingData: data,
                                                                  readingViewModel: readingViewModel)) {
                        ReadingDataRow(readingData: data)
                    }
                }
            }
            .listStyle(.sidebar)
            
            .navigationTitle("Reading List")
            .toolbar {
                Button {
                    showReadingDataEditor.toggle()
                } label: {
                    Label("Add new reading item", systemImage: "plus")
                }
                
            }
            .sheet(isPresented: $showReadingDataEditor) {
                ReadingDataEditorView(readingViewModel: readingViewModel)
            }
        }
    }
}

struct NavigationWebView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}
