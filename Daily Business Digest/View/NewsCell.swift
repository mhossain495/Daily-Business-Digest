//
//  NewsCell.swift
//  Daily Business Digest
//
//  Created by shanaaz begum on 2/27/21.
//

import UIKit

class NewsCell: UITableViewCell {
    
    // Create image and text label objects
    var articleImage = UIImageView()
    var articleTitle = UILabel()
    var articleStory = UILabel()
    var articleDate = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add subviews to display image and label objects in each cell
        addSubview(articleImage)
        addSubview(articleTitle)
        
        // Function call to configure appearance of the views
        configureTitleLabel()
        //configureImageView()
        setTitleConstraints()
        //setImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(article: Article) {
        articleTitle.text = article.title
        //articleImage.image = UIImage(systemName: "paperplane.fill")
    }
    
    // Configure appearance of the image and text label objects
    func configureImageView() {
        articleImage.layer.cornerRadius = 10
        articleImage.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        articleTitle.numberOfLines = 0
        articleTitle.adjustsFontSizeToFitWidth = true
    }
    /*
    func setImageConstraints() {
        articleImage.translatesAutoresizingMaskIntoConstraints = false
        articleImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        articleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        articleImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        articleImage.widthAnchor.constraint(equalTo: articleImage.heightAnchor, multiplier: 16/9).isActive = true
    }
    */
    
    // Set title label constraints
    func setTitleConstraints() {
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        articleTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        articleTitle.leadingAnchor.constraint(equalTo: articleImage.trailingAnchor, constant: 20).isActive = true
        articleTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
        articleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
}
