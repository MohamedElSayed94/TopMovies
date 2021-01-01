//
//  PopularTableViewCell.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 27/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
