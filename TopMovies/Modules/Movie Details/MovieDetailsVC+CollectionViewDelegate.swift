//
//  MovieDetailsViewController+CollectionViewDelegate.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 04/02/2021.
//  Copyright © 2021 Mohamed Elsayed. All rights reserved.
//

import Foundation
import UIKit

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imagesCollectionView {
            let url = URL(string: viewModel.details.images.posters[indexPath.row].image)
            let cell = imagesCollectionView.dequeue(indexPath: indexPath) as ImagesCollectionViewCell
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.kf.setImage(with: url, placeholder: TopMoviesImages.clapboard.image())
            
            return cell
        } else if collectionView == similarMoviesCollectionView {
            let url = URL(string: viewModel.similarMovieList[indexPath.row].poster ?? "")
            let cell = similarMoviesCollectionView.dequeue(indexPath: indexPath) as TopRatedCell
            cell.posterImage.kf.indicatorType = .activity
            cell.posterImage.kf.setImage(with: url, placeholder: TopMoviesImages.clapboard.image())
            cell.movieTitle.text = viewModel.similarMovieList[indexPath.row].title
            cell.movieSubTitle.text = StringModification().handleSubTitle(modelNode: viewModel.similarMovieList[indexPath.row])
            
            cell.heartImageView.image = self.viewModel.realmManager.isFavoured(id: viewModel.similarMovieList[indexPath.row].details.imdbID ?? "") ? TopMoviesImages.filledHeart.image() : TopMoviesImages.emptyHeart.image()
            cell.likedButton.tag = indexPath.row
            cell.likedButton.addTarget(self, action: #selector(self.handleFavouriteSimilarButton(sender:)), for: .allEvents)
            
            return cell
        }
        
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // force unwraped safely because We checked whether it's nil or not in viewModel.getTopRatedMovies(noOfMovies: Int)
        if collectionView == similarMoviesCollectionView {
            viewModel.similarMovieDidSelect(indexPath)
            updateData()
            viewModel.getSimilarMovies()
        } else if collectionView == imagesCollectionView {
            let url = URL(string: viewModel.details.images.posters[indexPath.row].image)
            self.mainImageView.kf.setImage(with: url, placeholder: UIImage(named: "clapboard"))
        }
        
        scrollView.setContentOffset(CGPoint(x: 0, y: -10), animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == imagesCollectionView {
            return viewModel.details.images.posters.count
        } else if collectionView == similarMoviesCollectionView {
            return viewModel.similarMovieList.count
        }
        
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize()
        
        if collectionView == imagesCollectionView {
            cellSize = CGSize(width: imagesCollectionView.bounds.size.width / 2, height: imagesCollectionView.bounds.size.height)
        } else if collectionView == similarMoviesCollectionView {
            cellSize = CGSize(width: similarMoviesCollectionView.bounds.size.width / 2.2, height: similarMoviesCollectionView.bounds.size.height)
        }
        
        return cellSize
    }
}
