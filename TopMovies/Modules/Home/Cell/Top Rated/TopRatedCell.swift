//
//  NowPlayingCollectionViewCell.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 26/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import UIKit

class TopRatedCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSubTitle: UILabel!
    @IBOutlet weak var likedButton: UIButton!
    @IBOutlet weak var heartImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    


}
