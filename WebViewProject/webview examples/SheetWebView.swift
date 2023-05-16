//
//  SheetWebView.swift
//  WebViewProject
//
//  Created by Karin Prater on 15.05.23.
//

import SwiftUI

struct SheetWebView: View {
    @State private var isSheetPresented = false
    @State private var isLoading = true
    let url = URL(string: "https://www.swiftyplace.com")
    
    var body: some View {
        Button(action: {
            isSheetPresented = true
        }) {
            Text("Open Web Page")
        }
        .sheet(isPresented: $isSheetPresented) {
            VStack(spacing: 0) {
                #if os(macOS)
                HStack {
                    Text(url?.absoluteString ?? "")
                    Spacer()
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Label("Close", systemImage: "xmark.circle")
                            .labelStyle(.iconOnly)
                    }
                }
                .padding(10)
                #endif
                LoadingWebView(url: url)
                    .frame(minWidth: 300, minHeight: 300)
            }
        }
    }
}

struct SheetWebView_Previews: PreviewProvider {
    static var previews: some View {
        SheetWebView()
    }
}
