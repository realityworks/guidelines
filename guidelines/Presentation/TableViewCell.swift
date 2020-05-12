//
//  TableViewCell.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let imageContainer = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with title: String, description: String, imageUrl: URL?) {
        // Todo
    }
}
