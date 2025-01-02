//
//  WebViewContainer.swift
//  NewsAPI
//
//  Created by Lucille Thoen (student LM) on 12/13/24.
//

import SwiftUI

struct WebViewContainer: View {
    
    @Binding var viewState: ViewState

    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WebViewContainer(viewState: .constant(.articleList))
}
