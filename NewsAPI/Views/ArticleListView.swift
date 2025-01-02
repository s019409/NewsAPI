//
//  ArticleListView.swift
//  NewsAPI
//
//  Created by Lucille Thoen (student LM) on 12/13/24.
//

import SwiftUI

struct ArticleListView: View {
    
    @Binding var viewState: ViewState
    @Binding var articleURL: String
    @State var data = FetchData()
    
    var body: some View {
        ScrollView {
            ForEach(data.response.articles){ article in
                VStack {
                    AsyncImage(url: article.urlToImage) {
                        phase in
                        switch phase {
                        case .empty :
                            ProgressView()
                        case.success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .frame(height: 150)
                        case .failure(let error):
                            Image("fnf")
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .frame(height: 150)
                        }
                    }
                    Text(article.title ?? "")
                        .padding()
                    Text(article.author ?? "")
                        .padding(.trailing)
                    Text(article.publishedAt ?? "")
                        .padding(.trailing)
                }
            }
            .task {
                await data.getData()
            }
        }
    }
}

#Preview {
    ArticleListView(viewState: .constant(.webView), articleURL: .constant(""))
}

