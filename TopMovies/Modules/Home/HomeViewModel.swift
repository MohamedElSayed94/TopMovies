//
//  HomeViewModel.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 23/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift



class HomeViewModel: BaseViewModel{
    
    var popularMoviesArray: BehaviorRelay<[Edges]> = .init(value: [])
    var popularMovieList = [Edges]()
    
    var topRatedMoviesArray: BehaviorRelay<[Edges]> = .init(value: [])
    var topRatedMovieList = [Edges]()
    
    var navigateToMovieDetails: PublishSubject<Node> = .init()
    var reloadPopular: PublishSubject<Bool> = .init()
    var reloadTopRated: PublishSubject<Bool> = .init()
    let networkDispatchGroup = DispatchGroup()
    var topRatedEndCursor: String?
    var popularEndCursor: String?
    var popularItemsTotalCount : Int?
    var topRatedItemsTotalCount : Int?
    var popularHasNext: Bool?
    var topRatedHasNext: Bool?
    override init() {
        super .init()
        self.isLoading.onNext(true)
        
    }
    
    func getPopularMovies(){
        networkDispatchGroup.enter()
        Network.shared.apollo.fetch(query: MoviesQuery(firstNumberOfMovies: 15, endCursor: popularEndCursor)) {[weak self] result in
            switch result{
            case .success(let data):
                // Serialize the response as JSON
                do{
                    let json = data.data?.movies.popular.jsonObject
                    let serialized = try JSONSerialization.data(withJSONObject: json, options: [])
                    let modelDecoded = try JSONDecoder().decode(Movie.self, from: serialized)
                    self?.popularItemsTotalCount = modelDecoded.totalCount
                    self?.popularEndCursor = modelDecoded.pageInfo.endCursor
                    self?.popularHasNext = modelDecoded.pageInfo.hasNextPage
                    print(self?.popularEndCursor)
                    guard var edges = modelDecoded.edges else{ self?.getPopularMovies(); return}
                    edges.removeAll(where: { $0.node == nil })
                    
                    self?.popularMovieList += edges
                    self?.popularMoviesArray.accept(self!.popularMovieList)
                }catch{
                    
                    print("error in getting PopularMovies Data")
                }
                LoadingIndicator.stop()
                self?.networkDispatchGroup.leave()
            case .failure(let error):
                print(error)
                LoadingIndicator.stop()
                self?.networkDispatchGroup.leave()
                self?.displayError.onNext("Server Error")
            }
        }
    }
    
    func getTopRatedMovies(){
        networkDispatchGroup.enter()
        Network.shared.apollo.fetch(query: TopRatedMoviesQuery(firstNumberOfMovies: 15, endCursor: topRatedEndCursor)) { [weak self] result in
            switch result{
            case .success(let data):
                // Serialize the response as JSON
                do{
                    guard let json = data.data?.movies.topRated.jsonObject else {return}
                    let serialized = try JSONSerialization.data(withJSONObject: json, options: [])
                    let modelDecoded = try JSONDecoder().decode(Movie.self, from: serialized)
                    self?.topRatedItemsTotalCount = modelDecoded.totalCount
                    self?.topRatedEndCursor = modelDecoded.pageInfo.endCursor
                    self?.topRatedHasNext = modelDecoded.pageInfo.hasNextPage
                    print(self?.topRatedEndCursor)
                    guard var edges = modelDecoded.edges else{ self?.getTopRatedMovies(); return}
                    edges.removeAll(where: { $0.node == nil })
                    self?.topRatedMovieList += edges
                    self?.topRatedMoviesArray.accept(self!.popularMovieList)
                }catch{
                    print("error in getting TopRatedMovies Data")
                }
                LoadingIndicator.stop()
                self?.networkDispatchGroup.leave()
            case .failure(let error):
                print(error)
                self?.networkDispatchGroup.leave()
                self?.displayError.onNext("Server Error")
            }
        }
    }
    
    func didSelectItemAtIndexPath(_ indexPath: IndexPath){
        if let model = popularMovieList[indexPath.row].node{
            navigateToMovieDetails.onNext(model)
        }
    }

    func handleFavouritePopularButton(index: Int){
        let id = popularMovieList[index].node?.details.imdbID ?? ""
        if (realmManager.isFavoured(id: id)){
            realmManager.deleteFavourite(id: id)
        }else{
            realmManager.addFavourite(id: id)
        }
        reloadPopular.onNext(true)
        reloadTopRated.onNext(true)
    }
    
    func handleFavouriteTopRatedButton(index: Int) -> (){
        let id = topRatedMovieList[index].node?.details.imdbID ?? ""
        if (realmManager.isFavoured(id: id)){
            realmManager.deleteFavourite(id: id)
        }else{
            realmManager.addFavourite(id: id)
        }
        reloadTopRated.onNext(true)
        reloadPopular.onNext(true)
    }
    
}
