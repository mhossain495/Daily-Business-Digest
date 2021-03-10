//
//  ArticleContentVC.swift
//  Daily Business Digest
//
//  Created by Mohammed Hossain on 3/6/21.
//

import Foundation
import UIKit

class ArticleContentVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let articleTitleLabel = UILabel()
    let articleAuthorLabel = UILabel()
    let articleDateLabel = UILabel()
    let articleContentLabel = UILabel()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Add Subviews
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(articleTitleLabel)
        contentView.addSubview(articleAuthorLabel)
        contentView.addSubview(articleDateLabel)
        contentView.addSubview(articleContentLabel)
        
        // Configure layout constraints for Subviews and configure label properties
        setScrollViewConstraints()
        setContentViewConstraints()
        
        setArticleTitleConstraints()
        setArticleAuthorLabelConstraints()
        setArticleDateLabelConstraints()
        setContentLabelConstraints()
        configureLabels()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureLabels() {
        articleTitleLabel.numberOfLines = 0
        articleAuthorLabel.numberOfLines = 0
        articleDateLabel.numberOfLines = 0
        articleContentLabel.numberOfLines = 0
        
        articleTitleLabel.sizeToFit()
        articleAuthorLabel.sizeToFit()
        articleDateLabel.sizeToFit()
        articleContentLabel.sizeToFit()
        
        articleTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        articleAuthorLabel.font = UIFont.italicSystemFont(ofSize: 16)
        articleDateLabel.font = UIFont.systemFont(ofSize: 12)
        articleDateLabel.textColor = UIColor.systemGray
    }
    

    
    // Set constraints for labels and views
    func setArticleTitleConstraints() {
        articleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        articleTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        articleTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
    }
    
    func setArticleAuthorLabelConstraints() {
        articleAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        articleAuthorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleAuthorLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 20).isActive = true
        articleAuthorLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
    }
    
    func setArticleDateLabelConstraints() {
        articleDateLabel.translatesAutoresizingMaskIntoConstraints = false
        articleDateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleDateLabel.topAnchor.constraint(equalTo: articleAuthorLabel.bottomAnchor, constant: 5).isActive = true
        articleDateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
    }
    
    
    func setContentLabelConstraints() {
        articleContentLabel.translatesAutoresizingMaskIntoConstraints = false
        articleContentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleContentLabel.topAnchor.constraint(equalTo: articleDateLabel.bottomAnchor, constant: 20).isActive = true
        articleContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        articleContentLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
    }
    
    func setScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
        
    func setContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
}

