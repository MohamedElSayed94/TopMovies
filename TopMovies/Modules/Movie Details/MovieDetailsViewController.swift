//
//  MovieDetailsViewController.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 27/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import UIKit
import Kingfisher
import RxCocoa
import RxSwift

class MovieDetailsViewController: BaseWireframe<MovieDetailsViewModel> {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var similarMoviesCollectionView: UICollectionView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateData()
        setupCollectionViewDelegates()
        registerCells()
        shareButton.addTarget(self, action: #selector(shareMovieURL), for: .allEvents)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getSimilarMovies()
        
    }

    override func bind(viewModel: MovieDetailsViewModel) {
        backButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.viewModel.onDismiss.onNext(true)
            self?.coordinator.dismiss()
            
        }).disposed(by: disposeBag)
        
        viewModel.similarMoviesArray.asObservable().subscribe { [weak self] (node) in
            guard let self = self else { return }
            self.similarMoviesCollectionView.reloadData()
        }.disposed(by: disposeBag)
        
        viewModel.reloadSimilar.subscribe { [weak self] (isLoading) in
            guard let isLoading = isLoading.element else { return }
            if(isLoading){
                self?.similarMoviesCollectionView.reloadData()
            }
        }.disposed(by: disposeBag)
        
    }
    
    
    func updateData(){
        let model = viewModel.details
        
        let url = URL(string: ( model.images.posters.last?.image) ?? "")
        mainImageView.kf.indicatorType = .activity
        mainImageView.kf.setImage(with: url,placeholder: UIImage(named: "clapboard"))
        
        movieTitle.text = model.title
        budgetLabel.text = (viewModel.formatLargeNumber(number: model.details.budget) == "0") ? "unknown budget" : "\(viewModel.formatLargeNumber(number: model.details.budget))$"
        movieDuration.text = "\(model.details.runtime) min"
        subTitleLabel.text = HomeViewModel().handleSubTitle(modelNode: model)
        overViewLabel.text = model.overview
        
        likeButton.setImage((self.viewModel.realmManager.isFavoured(id: model.details.imdbID ?? "")) ? TopMoviesImages.filledHeart.image() : TopMoviesImages.emptyHeart.image(), for: .normal)
        
        likeButton.addTarget(self, action: #selector(self.handleDetailsFavouriteButton), for: .allEvents)
        
        imagesCollectionView.reloadData()
        similarMoviesCollectionView.reloadData()
    }
    
    
    func setupCollectionViewDelegates(){
        
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        similarMoviesCollectionView.delegate = self
        similarMoviesCollectionView.dataSource = self
        
    }
    
    func registerCells(){
        imagesCollectionView.registerCell(cellClass: ImagesCollectionViewCell.self)
        similarMoviesCollectionView.registerCell(cellClass: TopRatedCell.self)
    }
    @objc func shareMovieURL(){
        let vc = UIActivityViewController(activityItems: [viewModel.details.details.homepage ?? ""], applicationActivities: [])
        self.present(vc, animated: true)
    }
    
    @objc func handleDetailsFavouriteButton(){
        viewModel.handleDetailsFavouriteButton()
        updateData()
        
    }
    @objc func handleFavouriteSimilarButton(sender:UIButton){
        viewModel.handleFavouriteSimilarButton(index: sender.tag)
    }

}

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == imagesCollectionView{
            let url = URL(string: (viewModel.details.images.posters[indexPath.row].image))
            let cell = imagesCollectionView.dequeue(indexPath: indexPath) as ImagesCollectionViewCell
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.kf.setImage(with: url,placeholder: TopMoviesImages.clapboard.image())
            
            return cell
        }else if collectionView == similarMoviesCollectionView{
            let url = URL(string: (viewModel.similarMovieList[indexPath.row].poster ?? ""))
            let cell = similarMoviesCollectionView.dequeue(indexPath: indexPath) as TopRatedCell
            cell.posterImage.kf.indicatorType = .activity
            cell.posterImage.kf.setImage(with: url,placeholder: TopMoviesImages.clapboard.image())
            cell.movieTitle.text = viewModel.similarMovieList[indexPath.row].title
            cell.movieSubTitle.text = HomeViewModel().handleSubTitle(modelNode: viewModel.similarMovieList[indexPath.row])
            
            cell.heartImageView.image = (self.viewModel.realmManager.isFavoured(id: viewModel.similarMovieList[indexPath.row].details.imdbID ?? "")) ? TopMoviesImages.filledHeart.image() : TopMoviesImages.emptyHeart.image()
            cell.likedButton.tag = indexPath.row
            cell.likedButton.addTarget(self, action: #selector(self.handleFavouriteSimilarButton(sender:)), for: .allEvents)
            
            
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //force unwraped safely because We checked whether it's nil or not in viewModel.getTopRatedMovies(noOfMovies: Int)
        if collectionView == similarMoviesCollectionView{
            viewModel.similarMovieDidSelect(indexPath)
            updateData()
            viewModel.getSimilarMovies()
        }else if collectionView == imagesCollectionView{
            let url = URL(string: (viewModel.details.images.posters[indexPath.row].image))
            self.mainImageView.kf.setImage(with: url,placeholder: UIImage(named: "clapboard"))
        }
        
        scrollView.setContentOffset(CGPoint(x: 0, y: -10), animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == imagesCollectionView{
             return viewModel.details.images.posters.count
        }else if collectionView == similarMoviesCollectionView{
            return viewModel.similarMovieList.count
    
        }
        
       return Int()
        
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellSize = CGSize()
        
        if collectionView == imagesCollectionView{
             cellSize = CGSize(width: (imagesCollectionView.bounds.size.width / 2) , height: imagesCollectionView.bounds.size.height )
        }else if collectionView == similarMoviesCollectionView{
            cellSize = CGSize(width: (similarMoviesCollectionView.bounds.size.width / 2.2) , height: similarMoviesCollectionView.bounds.size.height )
        }
        
        
        
        return cellSize
        
    }
    
}
