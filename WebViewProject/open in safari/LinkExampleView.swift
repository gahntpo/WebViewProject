//
//  LinkExampleView.swift
//  WebViewProject
//
//  Created by Karin Prater on 15.05.23.
//

import SwiftUI

struct LinkExampleView: View {
    var body: some View {
        if let url = URL(string: "https://www.swiftyplace.com") {
            Link("Visit SwiftyPlace", destination: url)
        }
    }
}

struct LinkExampleView_Previews: PreviewProvider {
    static var previews: some View {
        LinkExampleView()
    }
}
