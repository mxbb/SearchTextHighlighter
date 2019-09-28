//
//  SearchTableViewController.swift
//  SearchTextHighlighter
//
//  Created by Maxim on 28/09/2019.
//  Copyright © 2019 Maxim Ivunin. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    var models: [SearchModelProtocol] = SearchModel.generateModels(100)
    var searchModels: [SearchModelProtocol] = []
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchModels = models
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell

        let model = searchModels[indexPath.row]
        cell?.configure(with: model, searchText: searchText)

        return cell ?? UITableViewCell()
    }
}

extension SearchTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchModels = models
        } else {
            self.searchText = searchText
            searchModels = models.filter { searchText.matchesQuery(for: $0.searchWords) }
        }
        tableView.reloadData()
    }
}
