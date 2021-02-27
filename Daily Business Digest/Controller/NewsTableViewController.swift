//
//  NewsTableViewController.swift
//  Daily Business Digest
//
//  Created by shanaaz begum on 2/22/21.
//

import UIKit
import Alamofire
import Foundation

class NewsTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        fetchNews()
    }

    
var newsArray = [Article]()
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
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
extension NewsTableViewController {
    func fetchNews() {
        AF.request("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4c58992a34d74bbb93825a7084b551cf", method: .get).validate().responseDecodable(of: News.self) { (response) in
            guard let newsData = response.value else { return }
            self.newsArray = newsData.articles ?? []
            self.tableView.reloadData()
        }
    }
    
}
    
    
/*
 
 extension NewsTableViewController {
     func fetchNews() {
         // let jsonDecoder = JSONDecoder()
         
         
         AF.request("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4c58992a34d74bbb93825a7084b551cf", method: .get).validate().responseJSON { response in
             
             guard let data = response.data else { return }
             
             do {
                 let decoder = JSONDecoder()
                 let newsData = try decoder.decode(News.self, from: data)
                 print(newsData)
             } catch let error {
                 print(error)
                 
             }
         }
     }
     
 }
     
 */
