//
//  FavouritesViewController.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 26/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
class FavouritesViewController: BaseWireframe<FavouritesViewModel>,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Favourites List"
        setupTableViewDelegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getFavouriteMoviesId()
        
        
    }
    override func bind(viewModel: FavouritesViewModel) {
        viewModel.navigateToMovieDetails.asObservable().subscribe { [weak self] (node) in
            guard let self = self, let details = node.element else { return }
            let detailsViewModel = MovieDetailsViewModel(details: details)
            
            detailsViewModel.onDismiss.asObserver().subscribe(onNext: { (loaded) in
                DispatchQueue.main.async {
                    self.viewModel.reloadTableView.onNext(true)
                }
                
            }).disposed(by: self.disposeBag)
            
            
            self.coordinator.Main.navigate(to: .movieDetails(ViewModel: detailsViewModel), with: .present)
            
        }.disposed(by: disposeBag)
        
        
        
        viewModel.reloadTableView.subscribe (onNext:{ [weak self] (isLoading) in
            if(isLoading){
                self?.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    
    
    func setupTableViewDelegate(){
          
           tableView.estimatedRowHeight = tableView.frame.size.height / 3
           tableView.registerCellNib(cellClass: PopularTableViewCell.self)
           tableView.rx.setDelegate(self).disposed(by: disposeBag)
           viewModel.favouriteMoviesArray.bind(to: tableView.rx.items(cellIdentifier: String(describing: PopularTableViewCell.self), cellType: PopularTableViewCell.self)) { index, model, cell in
               cell.selectionStyle = .none
               
                   let url = URL(string: (model.poster ?? ""))
                       cell.titleLabel.text = model.title
                   
                   cell.posterImageView?.kf.indicatorType = .activity
                   cell.posterImageView?.kf.setImage(with: url,placeholder: UIImage(named: "clapboard"))
                   cell.subtitleLabel.text = HomeViewModel().handleSubTitle(modelNode: model)
                   cell.heartImageView.image = (self.viewModel.isFavoured(id: model.details.imdbID ?? "")) ? UIImage(named: "filledHeart") : UIImage(named: "emptyHeart")
                   cell.favouriteButton.tag = index
                   cell.favouriteButton.addTarget(self, action: #selector(self.handleFavouriteButton(sender:)), for: .allEvents)
                   cell.rateLabel.text = "\(model.rating)"
                   
           }.disposed(by: disposeBag)
           
           
           
           tableView.rx.itemSelected.subscribe { [weak self] (indexPath) in
               guard let self = self, let indexPath = indexPath.element else { return }
               self.viewModel.didSelectItemAtIndexPath(indexPath)
               
               
           }.disposed(by: disposeBag)
           
       }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 160
       }
    
    @objc func handleFavouriteButton(sender: UIButton){
        self.viewModel.handleFavouriteButton(index: sender.tag)
        
    }

}
