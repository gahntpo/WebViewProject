//
//  BrowserView.swift
//  WebViewProject
//
//  Created by Karin Prater on 16.05.23.
//

import SwiftUI

struct BrowserView: View {
    @StateObject var browserViewModel = BrowserViewModel()

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    browserViewModel.goBack()
                }) {
                    Image(systemName: "chevron.backward")
                }
                .disabled(!browserViewModel.canGoBack)
                
                Button(action: {
                    browserViewModel.goForward()
                }) {
                    Image(systemName: "chevron.forward")
                }
                .disabled(!browserViewModel.canGoForward)
  
                .padding(.trailing, 5)
                
                TextField("URL", text: $browserViewModel.urlString, onCommit: {
                     browserViewModel.loadURLString()
                 })
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                Button(action: {
                    browserViewModel.reload()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
            .padding(.horizontal)
            
            if let url =  URL(string: browserViewModel.urlString) {
                BrowserWebView(url: url,
                               viewModel: browserViewModel)
                .edgesIgnoringSafeArea(.all)
            } else {
                Text("Please, enter a url.")
            }
        }
    }
}


struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView()
    }
}
