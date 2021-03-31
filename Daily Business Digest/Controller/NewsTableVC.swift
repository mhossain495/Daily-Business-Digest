//
//  NewsTableViewController.swift
//  Daily Business Digest
//
//  Created by Mohammed Hossain on 2/28/21.
//

import UIKit
import Foundation
import Alamofire

class NewsTableVC: UITableViewController {
    
    var newsArray = [Article]()
    let newsCellID = "newsCell"
    let articleContentVC = ArticleContentVC()
    let dateFormatter = DateFormatter()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add title to navigation bar
        navigationItem.title = "News Feed"
        
        // Adjust row height of table view cells
        tableView.rowHeight = 100
        
        // Register custom reusable cell
        tableView.register(NewsCell.self, forCellReuseIdentifier: newsCellID)
        
        // Fetch news articles with API from newsapi.org using Alamofire
        fetchNews()
        
        // Add refresh control
        tableView.refreshControl = UIRefreshControl()
        
        // Add target and action to refresh data that is triggered when user pulls and releases table view
        tableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        
        // Add target and action to refresh data when app enters foreground after being in background
        NotificationCenter.default.addObserver(self, selector: #selector(appEnteredForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
            // Do any additional setup after loading the view.
    }
    
    // Function to fetch news data from API
    @objc private func pullToRefresh() {
        // Re-fetch news data
        fetchNews()
    }
    
    // Function to fetch news data from API when app enters foreground
    @objc func appEnteredForeground() {
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
        
        // Configure the custom cells with title and image
        let newsIndexPath = newsArray[indexPath.row]
        cell.articleTitle.text = newsIndexPath.title
        cell.articleImage.loadImageFromUrl(urlString: newsIndexPath.urlToImage ?? "")
        return cell
    }
    

    // MARK: - Navigation
    
    // Present article properties when user taps cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        articleContentVC.articleTitleLabel.text = newsArray[indexPath.row].title
        articleContentVC.articleContentLabel.text = newsArray[indexPath.row].articleDescription
        articleContentVC.articleDateLabel.text = dateFormatter.formatDate(dateString: newsArray[indexPath.row].publishedAt ?? "")
        
        if let articleAuthor = newsArray[indexPath.row].author {
            articleContentVC.articleAuthorLabel.text = "By \(articleAuthor)"
        } else {
            articleContentVC.articleAuthorLabel.text = .none
        }
        // Navigate to ArticleContentVC, which contains scroll view
        navigationController?.pushViewController(articleContentVC, animated: true)
    }
}

// MARK: - JSON Parsing

extension NewsTableVC {
    func fetchNews() {
        AF.request("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4c58992a34d74bbb93825a7084b551cf", method: .get).validate().responseDecodable(of: News.self) { (response) in
            guard let newsData = response.value else { return }
            self.newsArray = newsData.articles ?? []
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
}

