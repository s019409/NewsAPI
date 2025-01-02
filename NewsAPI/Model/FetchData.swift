//
//  FetchData.swift
//  NewsAPI
//
//  Created by Lucille Thoen (student LM) on 12/13/24.
//

import Foundation

struct FetchData {
    
    var response: Response = Response()
    
    mutating func getData() async {
        let URLString = "https://newsapi.org/v2/everything?q=tesla&from=2024-11-16&sortBy=publishedAt&apiKey=efef88a2d2684333a20b6f5e598bdf0d"
        
        guard let url = URL(string: URLString) else {return}
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {return}
        
        guard let r = try? JSONDecoder().decode(Response.self, from: data) else {return}
        
        response = r
    }
}

struct Response: Codable {
    var status: String = "Loading..."
    var totalResults: Int = 0
    var articles: [Article] = []
}

struct Article: Codable {
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: URL?
    var author: String?
    var publishedAt: String?
}

extension Article: Identifiable {
    var id: String {title ?? ""}
}
