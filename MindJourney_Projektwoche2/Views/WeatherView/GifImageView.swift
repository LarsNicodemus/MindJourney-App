//
//  GIFImageView.swift
//  Test1
//
//  Created by Lars Nicodemus on 28.11.24.
//

import SwiftUI
import WebKit
struct GifImageView: UIViewRepresentable {
    private let name: String
    init(_ name: String) {
        self.name = name
    }
    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        
        webview.isOpaque = false
        webview.backgroundColor = .clear
        
        webview.scrollView.backgroundColor = .clear
        
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webview.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        return webview
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}
