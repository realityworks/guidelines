//
//  TableViewCell.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let containedImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Setup the UI Components
        let imageContainer = UIView()
        contentView.addSubview(imageContainer)
        
        imageContainer.leftToSuperview()
        imageContainer.topToSuperview()
        imageContainer.width(90)
        imageContainer.aspectRatio(1)
        
        imageContainer.addSubview(containedImageView)
        containedImageView.centerYToSuperview()
        containedImageView.centerXToSuperview()
        containedImageView.width(60)
        containedImageView.aspectRatio(1)
        containedImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(titleLabel)
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        titleLabel.height(20)
        titleLabel.leftToRight(of: imageContainer, offset: 8)
        titleLabel.rightToSuperview()
        titleLabel.topToSuperview(offset: 8)
            
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        descriptionLabel.leftToRight(of: imageContainer, offset: 8)
        descriptionLabel.topToBottom(of: titleLabel, offset: 8)
        descriptionLabel.rightToSuperview()
        descriptionLabel.bottomToSuperview()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        containedImageView.contentMode = .scaleAspectFill
    }

    func configure(with fact: Facts.Fact) {
        titleLabel.text = fact.title
        descriptionLabel.text = fact.description
        containedImageView.update(with: URL(string: fact.imageHref ?? ""))
    }
}
