//
//  NowPlayingCollectionViewCell.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 26/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import UIKit

class TopRatedCell: UICollectionViewCell {
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieSubTitle: UILabel!
    @IBOutlet var likedButton: UIButton!
    @IBOutlet var heartImageView: UIImageView!
    
    var index: Int?
    var viewModel: BaseViewModel?
    var node: Node?
    var favouriteButtonAction: (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(node: Node, viewModel: BaseViewModel, index: Int, favouriteButtonAction: @escaping ()->()) {
        self.index = index
        self.favouriteButtonAction = favouriteButtonAction
        self.viewModel = viewModel
        self.node = node
        
        let url = URL(string: node.poster ?? "")
        movieTitle.text = node.title
        posterImage.kf.indicatorType = .activity
        posterImage.kf.setImage(with: url, placeholder: TopMoviesImages.clapboard.image())
        movieSubTitle.text = StringModification().handleSubTitle(modelNode: node)
        heartImageView.image = viewModel.realmManager.isFavoured(id: node.details.imdbID ?? "") ? TopMoviesImages.filledHeart.image() : TopMoviesImages.emptyHeart.image()
        likedButton.tag = index
        likedButton.addTarget(self, action: #selector(handleFavouriteTopRatedButton(sender:)), for: .allEvents)
    }
    
    @objc func handleFavouriteTopRatedButton(sender: UIButton) {
        favouriteButtonAction!()
    }
}
