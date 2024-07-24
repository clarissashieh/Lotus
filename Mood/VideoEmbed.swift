//
//  VideoEmbed.swift
//  mood-page
//
//  Created by Cara Lee on 3/14/22.
//

import SwiftUI
import WebKit

struct VideoEmbed: UIViewRepresentable {
    
    
    let videoID: String

    
    func makeUIView(context: Context) -> WKWebView {
        addPoints()
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let videoURL = URL(string: "https://youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = true
        uiView.load(URLRequest(url: videoURL))
    }
    
    
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    @State static var defaults = UserDefaults.standard
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        if UserDefaults.standard.object(forKey: "Points") == nil {
            AppDelegate.defaults.register(defaults: ["Points" : 0])
        }
        
    }
}



