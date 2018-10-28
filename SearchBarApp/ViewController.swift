//
//  ViewController.swift
//  SearchBarApp
//
//  Created by Josef Karakoca on 2018-10-27.
//  Copyright © 2018 Josef Karakoca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func btnpress(_ sender: Any) {
        print("hello world")
    
    }
    
    
    var listWithData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateListWithData()
    }
    
    
    private func updateListWithData(){
        // http://runeberg.org/words/ss100.txt
        listWithData.append("Test1")
        listWithData.append("aabb2")
        listWithData.append("aacc3")
        listWithData.append("abb4")
        listWithData.append("abb4")
        listWithData.append("abb4")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listWithData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  else {
            return UITableViewCell()
        }
        
        let title = listWithData[indexPath.row]
        cell.textLabel?.text = title
        return cell
    }
    
}
