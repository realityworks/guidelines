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
    private let imageContainer = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Setup the UI Components
        
        let vStack = UIStackView()
        vStack.alignment = .fill
        vStack.distribution = .fillProportionally
        vStack.addArrangedSubview(titleLabel)
        titleLabel.edgesToSuperview(excluding: [.top, .bottom])
        titleLabel.text = "TEST"
        
        vStack.addArrangedSubview(descriptionLabel)
        descriptionLabel.edgesToSuperview(excluding: [.top, .bottom])
        descriptionLabel.text = "DESCRIPTION TEST"
        
        let hStack = UIStackView()
        hStack.alignment = .fill
        hStack.axis = .horizontal
        
        hStack.addArrangedSubview(imageContainer)
        imageContainer.leftToSuperview()
        imageContainer.width(100)
        imageContainer.aspectRatio(1)
        imageContainer.contentMode = .scaleAspectFit
        
        contentView.addSubview(hStack)
        
        // So much easier just to use a wrapper library
        hStack.edgesToSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with title: String, description: String, imageUrl: URL?) {
        // Todo
    }
}
