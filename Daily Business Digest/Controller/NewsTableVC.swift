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
  
 
    // Create tableView object
    //let NewsTableVC = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add title to navigation bar
        navigationItem.title = "News Feed"
        
        // Add NewsTableVC to current view controller
        //view.addSubview(NewsTableVC)
        
        tableView.rowHeight = 100
      
        // Set delegates
        //NewsTableVC.delegate = self
        //NewsTableVC.dataSource = self
        
        
        
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
    
    // Present article content when user taps table view cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ArticleContentVC(), animated: true)
    }

  

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

   

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    
    
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
