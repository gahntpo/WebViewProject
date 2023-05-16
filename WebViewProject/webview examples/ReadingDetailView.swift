//
//  ReadingDetailView.swift
//  WebViewProject
//
//  Created by Karin Prater on 16.05.23.
//

import SwiftUI

struct ReadingDetailView: View {
    
    let url: URL
    @ObservedObject var readingViewModel: ReadingListViewModel
    
    @State private var showConfirmationDialog: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        LoadingWebView(url: url)
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
            .toolbar {
                Button(role: .destructive) {
                    showConfirmationDialog.toggle()
                } label: {
                    Label("Delete", systemImage: "trash")
                }.foregroundColor(.pink)

            }
            
            .confirmationDialog("Are you sure you want to delete this url?",
                                isPresented: $showConfirmationDialog,
                                titleVisibility: .visible) {
                Button("Delete", role: .destructive) {
                    dismiss()
                    readingViewModel.remove(url)
                }
            }
    }
}

struct ReadingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReadingDetailView(url: URL(string: "https://www.swiftyplace.com")!,
                              readingViewModel: ReadingListViewModel())
        }
    }
}
