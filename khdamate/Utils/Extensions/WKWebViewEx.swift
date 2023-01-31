/************************* Mo’min J.Abusaada *************************/
//
//  WKWebViewEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import WebKit

extension WKWebView {
    func loadHTMLWithLocalCSS(_ string:String){
        if let cssPath = Bundle.main.path(forResource:"webView", ofType:"css"), cssPath.count > 0 {
            self.loadHTMLString(string.html(isWKWebView: true), baseURL: URL(fileURLWithPath: cssPath))
        }else{
            self.loadHTMLString(string.html(isWKWebView: true), baseURL: nil)
        }
    }
}
