//
//  NewsTableViewController.swift
//  News
//
//  Created by Junior Ferreira on 19/08/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell does not exist")
        }
        
        cell.titleLabel.text = self.articles[indexPath.row].title
        cell.descriptionLabel.text = self.articles[indexPath.row].title
        
        return cell
    }
    
    private func populateNews() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=42c9f103af864d26b78d8c8e7c17196a")
        
        Observable.just(url)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url!)
                return URLSession.shared.rx.data(request: request)
            } . map { data -> [Article]? in
                return try? JSONDecoder().decode(ArticlesList.self, from: data).articles
            }.subscribe(onNext: { articles in
                
                if let articles = articles {
                    self.articles = articles
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
            }).disposed(by: disposeBag)
        
    }
}
