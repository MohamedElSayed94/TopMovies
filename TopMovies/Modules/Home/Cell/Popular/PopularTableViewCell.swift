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
    
    var index:Int?
    var viewModel: BaseViewModel?
    var node: Node?
    var favouriteButtonAction: (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(node:Node,viewModel: BaseViewModel, favouriteButtonAction: @escaping ()->() ){
        index = getIndexPath()?.row
        self.favouriteButtonAction = favouriteButtonAction
        self.viewModel = viewModel
        self.node = node
        
        let url = URL(string: (node.poster ?? ""))
        titleLabel.text = node.title
        posterImageView?.kf.indicatorType = .activity
        posterImageView?.kf.setImage(with: url,placeholder: TopMoviesImages.clapboard.image())
        subtitleLabel.text = StringModification().handleSubTitle(modelNode: node)
        heartImageView.image = (self.viewModel?.realmManager.isFavoured(id: node.details.imdbID ?? "") ?? Bool()) ? TopMoviesImages.filledHeart.image() : TopMoviesImages.emptyHeart.image()
        favouriteButton.tag = index ?? Int()
        favouriteButton.addTarget(self, action: #selector(self.handleFavouritePopularButton(sender:)), for: .allEvents)
        rateLabel.text = "\(node.rating)"
        
    }
    @objc func handleFavouritePopularButton(sender: UIButton){
        favouriteButtonAction!()
    }
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        let indexPath = superView.indexPath(for: self)
        return indexPath
    }
}
