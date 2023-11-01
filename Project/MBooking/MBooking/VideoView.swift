//
//  VideoView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoID: "5GfBK30k24c")
    }
}
