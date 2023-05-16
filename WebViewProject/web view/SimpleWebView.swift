//
//  WebView.swift
//  WebViewProject
//
//  Created by Karin Prater on 15.05.23.
//


import SwiftUI
import WebKit

struct SimpleWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView  {
        let wkwebView = WKWebView()
        wkwebView.load(URLRequest(url: url))
        return wkwebView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleWebView(url: URL(string: "https://www.swiftyplace.com")!)
    }
}
