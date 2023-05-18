//
//  ReadingDataEditorView.swift
//  WebViewProject
//
//  Created by Karin Prater on 17.05.23.
//

import SwiftUI

struct ReadingDataEditorView: View {
    
    enum FocusedField {
        case title, url
    }
    
    @ObservedObject var readingViewModel: ReadingListViewModel
    
    @State var newURLString = ""
    @State var title = ""
    @FocusState private var focusedField: FocusedField?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
        
            Text("Create new reading item")
                .font(.title2)
            HStack {
                Text("Title:")
                TextField("title", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .title)
            }
            
            HStack {
                Text("URL:")
                TextField("New URL", text: $newURLString)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .url)
            }
            
            
            HStack {
                
                Button("Cancel") {
                    dismiss()
                }
                .buttonStyle(.bordered)
                
                Button(action: {
                finish()
                }) {
                    Text("Add")
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .padding()
        .onSubmit {
            if focusedField == .title {
                focusedField = .url
            } else {
                finish()
            }
        }
        .onAppear {
            focusedField = .title
        }
    }
    
    func finish() {
        if let url = URL(string: newURLString) {
            readingViewModel.add(url, title: title)
            dismiss()
        }
    }
}

struct ReadingDataEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingDataEditorView(readingViewModel: ReadingListViewModel())
    }
}
