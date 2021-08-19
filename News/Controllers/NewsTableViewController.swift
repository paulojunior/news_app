//
//  NewsTableViewController.swift
//  News
//
//  Created by Junior Ferreira on 19/08/21.
//

import Foundation
import UIKit

class NewsTableViewController: UITableViewController {
    
    /*
     let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=42c9f103af864d26b78d8c8e7c17196a")!
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
