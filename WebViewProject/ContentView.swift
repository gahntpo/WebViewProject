//
//  ContentView.swift
//  WebViewProject
//
//  Created by Karin Prater on 15.05.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("test")
        //SimpleWebView(url: URL(string: "https://www.swiftyplace.com")!)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
