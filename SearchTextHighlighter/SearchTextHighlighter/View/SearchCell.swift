//
//  SearchCell.swift
//  SearchTextHighlighter
//
//  Created by Maxim on 28/09/2019.
//  Copyright © 2019 Maxim Ivunin. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func configure(with searchModel: SearchModelProtocol, searchText: String) {
        titleLabel?.text = searchModel.title
        subtitleLabel?.text = searchModel.subtitle
    }
}
