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
    let articleContentLabel = UILabel()
    let articleTitleLabel = UILabel()
    let articleAuthorLabel = UILabel()
    let contentView = UIView()
    
   
    override func viewDidLoad() {
        view.backgroundColor = .white
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Add Subviews
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(articleContentLabel)
        contentView.addSubview(articleTitleLabel)
        contentView.addSubview(articleAuthorLabel)
        
        // Configure layout constraints for Subviews and configure label properties
        setScrollViewConstraints()
        setContentViewConstraints()
        setContentLabelConstraints()
        setArticleTitleConstraints()
        configureLabels()
        setArticleAuthorLabelConstraints()
        setArticleAuthorLabelConstraints()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureLabels() {
        articleTitleLabel.numberOfLines = 0
        articleContentLabel.numberOfLines = 0
        articleAuthorLabel.numberOfLines = 0
        
        articleTitleLabel.sizeToFit()
        articleContentLabel.sizeToFit()
        articleAuthorLabel.sizeToFit()
    
        articleTitleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        articleAuthorLabel.font = UIFont.italicSystemFont(ofSize: 16.0)
    }
    

    
    // Set constraints for labels and views
    func setContentLabelConstraints() {
        articleContentLabel.translatesAutoresizingMaskIntoConstraints = false
        articleContentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleContentLabel.topAnchor.constraint(equalTo: articleAuthorLabel.bottomAnchor, constant: 20).isActive = true
        articleContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        articleContentLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
    }
    
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
