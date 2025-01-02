//
//  ContentView.swift
//  NewsAPI
//
//  Created by Lucille Thoen (student LM) on 12/10/24.
//

import SwiftUI

enum ViewState {
    case articleList, webView
}


struct ContentView: View {
    
    @State var viewState: ViewState = .articleList
    @State var articleURL: String = ""
    
    var body: some View {
        
        if viewState == .articleList {
            ArticleListView(viewState: $viewState, articleURL: $articleURL)
        } else {
            WebViewContainer(viewState: $viewState)
        }
        
    }
}

#Preview {
    ContentView()
}
