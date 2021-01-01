//
//  HomeViewController+TableViewDelegate.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 27/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Kingfisher
extension HomeViewController: UITableViewDelegate{
    

    
    func setupPopularTableViewDelegate(){
       
        popularTableView.estimatedRowHeight = popularTableView.frame.size.height / 3
        popularTableView.registerCellNib(cellClass: PopularTableViewCell.self)
        
        popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.popularMoviesArray.bind(to: popularTableView.rx.items(cellIdentifier: String(describing: PopularTableViewCell.self), cellType: PopularTableViewCell.self)) { index, model, cell in
            cell.selectionStyle = .none
            if let node = model.node {
                let url = URL(string: (node.poster ?? ""))
                    cell.titleLabel.text = node.title
                
                cell.posterImageView?.kf.indicatorType = .activity
                cell.posterImageView?.kf.setImage(with: url,placeholder: UIImage(named: "clapboard"))
                cell.subtitleLabel.text = self.viewModel.handleSubTitle(modelNode: node)
                cell.heartImageView.image = (self.viewModel.isFavoured(id: model.node?.details.imdbID ?? "")) ? UIImage(named: "filledHeart") : UIImage(named: "emptyHeart")
                cell.favouriteButton.tag = index
                cell.favouriteButton.addTarget(self, action: #selector(self.handleFavouritePopularButton(sender:)), for: .allEvents)
                
                
                cell.rateLabel.text = "\(node.rating)"
                
                if index == self.viewModel.popularMoviesArray.value.count - 1 { // last cell
                    if self.viewModel.popularHasNext ?? true { // more items to fetch
                        LoadingIndicator.start(vc: self)
                        self.viewModel.getPopularMovies()
                    }
                }
            }
            
        }.disposed(by: disposeBag)
        
        
        
        popularTableView.rx.itemSelected.subscribe { [weak self] (indexPath) in
            guard let self = self, let indexPath = indexPath.element else { return }
            self.viewModel.didSelectItemAtIndexPath(indexPath)
            
            
        }.disposed(by: disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}
