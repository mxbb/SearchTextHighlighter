//
//  SearchModel.swift
//  SearchTextHighlighter
//
//  Created by Maxim on 28/09/2019.
//  Copyright © 2019 Maxim Ivunin. All rights reserved.
//

struct SearchModel {
    private var firstName = ""
    private var lastName = ""
    private var username = ""
    
    static func generateModels(_ count: Int) -> [SearchModel] {
        var models: [SearchModel] = []
        for _ in 0..<count {
            let model = SearchModel(
                firstName: "fn\(Int.random(in: 1..<count))",
                lastName: "ln\(Int.random(in: 1..<count))",
                username: "username\(Int.random(in: 1..<count))"
            )
            models.append(model)
        }
        return models
    }
}

extension SearchModel: SearchModelProtocol {
    
    //MARK - SearchModelProtocol
    
    var title: String {
        return "\(firstName) \(lastName)"
    }
    
    var subtitle: String {
        return "@\(username)"
    }
    
    var searchWords: [String] {
        return "\(firstName) \(lastName) \(username)"
            .lowercased()
            .components(separatedBy: " ")
    }
}
