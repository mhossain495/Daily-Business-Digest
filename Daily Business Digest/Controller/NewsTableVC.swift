//
//  NewsTableViewController.swift
//  Daily Business Digest
//
//  Created by shanaaz begum on 2/28/21.
//

import UIKit
import Foundation
import Alamofire

class NewsTableVC: UITableViewController {
    
    var newsArray = [Article]()
    let newsCellID = "newsCell"
    let articleContentVC = ArticleContentVC()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add title to navigation bar
        navigationItem.title = "News Feed"
        tableView.rowHeight = 100
      

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Register custom reusable cell
        tableView.register(NewsCell.self, forCellReuseIdentifier: newsCellID)

        // Fetch news articles with API from newsapi.org with Alamofire
        fetchNews()
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCellID, for: indexPath) as! NewsCell

        // Configure the cell...
        let newsIndexPath = newsArray[indexPath.row]
        cell.articleTitle.text = newsIndexPath.title
        cell.articleImage.loadImageFromUrl(urlString: newsIndexPath.urlToImage ?? "")
        
        return cell
    }
   
    
    // MARK: - Navigation
    
    // Present article description when user taps table view cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        articleContentVC.articleContentLabel.text = newsArray[indexPath.row].articleDescription
        articleContentVC.articleTitleLabel.text = newsArray[indexPath.row].title
        navigationController?.pushViewController(articleContentVC, animated: true)
    }

}


// MARK: - JSON Parsing

extension NewsTableVC {
    func fetchNews() {
        AF.request("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4c58992a34d74bbb93825a7084b551cf", method: .get).validate().responseDecodable(of: News.self) { (response) in
            guard let newsData = response.value else { return }
            self.newsArray = newsData.articles ?? []
            self.tableView.reloadData()
        }
    }
}
