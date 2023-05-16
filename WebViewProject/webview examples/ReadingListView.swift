//
//  NavigationWebView.swift
//  WebViewProject
//
//  Created by Karin Prater on 15.05.23.
//

import SwiftUI

struct ReadingListView: View {
    
    @StateObject var readingViewModel = ReadingListViewModel()
    @State var newURLString = ""
    @State var selectedURL: URL?
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("New URL", text: $newURLString)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        if let url = URL(string: newURLString) {
                            readingViewModel.add(url)
                            newURLString = ""
                        }
                    }) {
                        Text("Add")
                    }
                }
                .padding()
                
                List {
                    ForEach(readingViewModel.urls, id: \.self) { url in
                        NavigationLink(destination: ReadingDetailView(url: url,
                                                                      readingViewModel: readingViewModel)) {
                            Text(url.absoluteString)
                        }
                    }
                }
                .listStyle(.sidebar)
            }
            .navigationTitle("Reading List")
        }
    }
}

struct NavigationWebView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}
