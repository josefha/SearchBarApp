//
//  MainTableViewController.swift
//  SearchBarApp
//
//  Created by Josef Karakoca on 2018-10-27.
//  Copyright © 2018 Josef Karakoca. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var table: UITableView!
    
    var listWithData = [String]()
    var filteredList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateListWithData()
    }

    private func updateListWithData(){
        let url = "http://runeberg.org/words/ss100.txt"
        if let dataSource = URL(string: url) {
            do {
                let content = try String(contentsOf: dataSource, encoding: .ascii)
                listWithData = []
                content.enumerateLines(invoking: {
                    word, _ in self.listWithData.append(word)
                })
            } catch let error {
                listWithData = []
                print("Error: \(error)")
            }
        }
        filteredList = listWithData
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text {
            if text == "" {
                filteredList = listWithData
            }else{
                filteredList = listWithData.filter({item -> Bool in
                    let textLowerCased = text.lowercased()
                    let itemLowerCased = item.lowercased()
                    return itemLowerCased.contains(textLowerCased)
                })
            }
        }
        table.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredList[indexPath.row]
        return cell
    }
}
