//
//  BrowserViewModel.swift
//  WebViewProject
//
//  Created by Karin Prater on 16.05.23.
//

import Foundation
import WebKit

class BrowserViewModel: NSObject, ObservableObject {
    weak var webView: WKWebView? {
        didSet {
            webView?.navigationDelegate = self
        }
    }
    
    @Published var urlString = "https://www.apple.com"
    @Published var canGoBack = false
    @Published var canGoForward = false
    
    func loadURLString() {
        if let url = URL(string: urlString) {
            webView?.load(URLRequest(url: url))
        }
    }
    
    func goBack() {
        webView?.goBack()
    }
    
    func goForward() {
        webView?.goForward()
    }
    
    func reload() {
        webView?.reload()
    }
}

extension BrowserViewModel: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        canGoBack = webView.canGoBack
        canGoForward = webView.canGoForward
        urlString = webView.url?.absoluteString ?? ""
    }
}
