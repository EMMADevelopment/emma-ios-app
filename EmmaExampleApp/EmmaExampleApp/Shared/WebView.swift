//
//  WebView.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 7/10/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
