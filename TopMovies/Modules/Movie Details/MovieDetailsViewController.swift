//
//  MovieDetailsViewController.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 27/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import Kingfisher
import RxCocoa
import RxSwift
import UIKit

class MovieDetailsViewController: BaseWireframe<MovieDetailsViewModel> {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var budgetLabel: UILabel!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var movieDuration: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var overViewLabel: UILabel!
    @IBOutlet var imagesCollectionView: UICollectionView!
    @IBOutlet var similarMoviesCollectionView: UICollectionView!
    
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
        
        viewModel.similarMoviesArray.asObservable().subscribe { [weak self] _ in
            guard let self = self else { return }
            self.similarMoviesCollectionView.reloadData()
        }.disposed(by: disposeBag)
        
        viewModel.reloadSimilar.subscribe { [weak self] isLoading in
            guard let isLoading = isLoading.element else { return }
            if isLoading {
                self?.similarMoviesCollectionView.reloadData()
            }
        }.disposed(by: disposeBag)
    }
    
    func updateData() {
        let model = viewModel.details
        
        let url = URL(string: (model.images.posters.last?.image) ?? "")
        mainImageView.kf.indicatorType = .activity
        mainImageView.kf.setImage(with: url, placeholder: UIImage(named: "clapboard"))
        
        movieTitle.text = model.title
        budgetLabel.text = (viewModel.formatLargeNumber(number: model.details.budget) == "0") ? "unknown budget" : "\(viewModel.formatLargeNumber(number: model.details.budget))$"
        movieDuration.text = "\(model.details.runtime) min"
        subTitleLabel.text = StringModification().handleSubTitle(modelNode: model)
        overViewLabel.text = model.overview
        
        likeButton.setImage(viewModel.realmManager.isFavoured(id: model.details.imdbID ?? "") ? TopMoviesImages.filledHeart.image() : TopMoviesImages.emptyHeart.image(), for: .normal)
        
        likeButton.addTarget(self, action: #selector(handleDetailsFavouriteButton), for: .allEvents)
        
        imagesCollectionView.reloadData()
        similarMoviesCollectionView.reloadData()
    }
    
    func setupCollectionViewDelegates() {
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        similarMoviesCollectionView.delegate = self
        similarMoviesCollectionView.dataSource = self
    }
    
    func registerCells() {
        imagesCollectionView.registerCell(cellClass: ImagesCollectionViewCell.self)
        similarMoviesCollectionView.registerCell(cellClass: TopRatedCell.self)
    }

    @objc func shareMovieURL() {
        let vc = UIActivityViewController(activityItems: [viewModel.details.details.homepage ?? ""], applicationActivities: [])
        present(vc, animated: true)
    }
    
    @objc func handleDetailsFavouriteButton() {
        viewModel.handleDetailsFavouriteButton()
        updateData()
    }

    @objc func handleFavouriteSimilarButton(sender: UIButton) {
        viewModel.handleFavouriteSimilarButton(index: sender.tag)
    }
}
