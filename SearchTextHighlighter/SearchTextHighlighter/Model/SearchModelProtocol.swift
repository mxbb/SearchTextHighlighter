//
//  SearchModelProtocol.swift
//  SearchTextHighlighter
//
//  Created by Maxim on 28/09/2019.
//  Copyright © 2019 Maxim Ivunin. All rights reserved.
//

protocol SearchModelProtocol {
    var searchWords: [String] { get }
    var title: String { get }
    var subtitle: String { get }
}
