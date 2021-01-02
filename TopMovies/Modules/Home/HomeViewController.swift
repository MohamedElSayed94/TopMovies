//
//  HomeViewController.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 26/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
class HomeViewController: BaseWireframe<HomeViewModel> {
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    @IBOutlet weak var popularTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Home"
        setupCollectionViewDelegates()
        registerCells()
        setupPopularTableViewDelegate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.isLoading.onNext(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getPopularMovies()
        self.viewModel.getTopRatedMovies()
        popularTableView.reloadData()
        self.viewModel.networkDispatchGroup.notify(queue: .main) {
            self.viewModel.isLoading.onNext(false)
        }
    }
    
    func setupCollectionViewDelegates(){
        topRatedCollectionView.delegate = self
        topRatedCollectionView.dataSource = self
    }
    
    func registerCells(){
        topRatedCollectionView.registerCell(cellClass: TopRatedCell.self)
    }
    
    
    
    override func bind(viewModel: HomeViewModel) {
        viewModel.navigateToMovieDetails.asObservable().subscribe { [weak self] (node) in
            guard let self = self, let details = node.element else { return }
            let detailsViewModel = MovieDetailsViewModel(details: details)
            detailsViewModel.onDismiss.asObserver().subscribe(onNext: { (loaded) in
                DispatchQueue.main.async {
                    self.viewModel.reloadTopRated.onNext(true)
                    self.viewModel.reloadPopular.onNext(true)
                }
            }).disposed(by: self.disposeBag)
            self.coordinator.Main.navigate(to: .movieDetails(ViewModel: detailsViewModel), with: .present)
        }.disposed(by: disposeBag)
        
        viewModel.topRatedMoviesArray.asObservable().subscribe (onNext:{ [weak self] (node) in
            guard let self = self else { return }
            self.topRatedCollectionView.reloadData()
        }).disposed(by: disposeBag)
        
        viewModel.reloadPopular.subscribe (onNext:{ [weak self] (isLoading) in
            if(isLoading){
                self?.popularTableView.reloadData()
            }
        }).disposed(by: disposeBag)
        viewModel.reloadTopRated.subscribe (onNext:{ [weak self] (isLoading) in
            if(isLoading){
                self?.topRatedCollectionView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    
    @objc func handleFavouritePopularButton(sender: UIButton){
        self.viewModel.handleFavouritePopularButton(index: sender.tag)
        
    }
    @objc func handleFavouriteTopRatedButton(sender: UIButton){
        self.viewModel.handleFavouriteTopRatedButton(index: sender.tag)
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = topRatedCollectionView.dequeue(indexPath: indexPath) as TopRatedCell
        let node = viewModel.topRatedMovieList[indexPath.row].node
        let url = URL(string: (node?.poster ?? ""))
        cell.movieTitle.text = node?.title
        cell.posterImage.kf.indicatorType = .activity
        cell.posterImage.kf.setImage(with: url,placeholder: UIImage(named: "clapboard"))
        cell.movieSubTitle.text = self.viewModel.handleSubTitle(modelNode: node)
        cell.heartImageView.image = (self.viewModel.isFavoured(id: node?.details.imdbID ?? "")) ? UIImage(named: "filledHeart") : UIImage(named: "emptyHeart")
        cell.likedButton.tag = indexPath.row
        cell.likedButton.addTarget(self, action: #selector(self.handleFavouriteTopRatedButton(sender:)), for: .allEvents)
        if indexPath.row == self.viewModel.topRatedMovieList.count - 1 { // last cell
            if self.viewModel.topRatedHasNext ?? true { // more items to fetch
                LoadingIndicator.start(vc: self)
                self.viewModel.getTopRatedMovies()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //force unwraped safely because We checked whether it's nil or not in viewModel.getTopRatedMovies(noOfMovies: Int)
        viewModel.navigateToMovieDetails.onNext(viewModel.topRatedMovieList[indexPath.row].node!)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.topRatedMovieList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize: CGSize
        cellSize = CGSize(width: (topRatedCollectionView.bounds.size.width / 2.2) , height: topRatedCollectionView.bounds.size.height )
        return cellSize
    }
    
}


