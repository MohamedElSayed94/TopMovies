//
//  HomeViewController+TableViewDelegate.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 27/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import Foundation
import Kingfisher
import RxCocoa
import RxSwift
import UIKit
extension HomeViewController: UITableViewDelegate {
    func setupPopularTableViewDelegate() {
        popularTableView.estimatedRowHeight = popularTableView.frame.size.height / 3
        popularTableView.registerCellNib(cellClass: PopularTableViewCell.self)
        popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.popularMoviesArray.bind(to: popularTableView.rx.items(cellIdentifier: String(describing: PopularTableViewCell.self), cellType: PopularTableViewCell.self)) { index, model, cell in
            cell.selectionStyle = .none
            if let node = model.node {
                cell.configure(node: node, viewModel: self.viewModel, favouriteButtonAction: {
                    self.viewModel.handleFavouritePopularButton(index: index)
                })
            }
            if index == self.viewModel.popularMoviesArray.value.count - 1 { // last cell
                if self.viewModel.popularHasNext ?? true { // more items to fetch
                    LoadingIndicator.start(vc: self)
                    self.viewModel.getPopularMovies()
                }
            }
        }.disposed(by: disposeBag)
        popularTableView.rx.itemSelected.subscribe { [weak self] indexPath in
            guard let self = self, let indexPath = indexPath.element else { return }
            self.viewModel.didSelectItemAtIndexPath(indexPath)
        }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
