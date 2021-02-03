//
//  FavouritesViewModel.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 26/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift
class FavouritesViewModel: BaseViewModel{
    var favouriteMoviesArray: BehaviorRelay<[Node]> = .init(value: [])
    var favouriteMovieList = [Node]()
    var navigateToMovieDetails: PublishSubject<Node> = .init()
    var reloadTableView: PublishSubject<Bool> = .init()
    var favouriteIdsArr = [String]()
    
    
    
    func didSelectItemAtIndexPath(_ indexPath: IndexPath){
        let model = favouriteMovieList[indexPath.row]
        navigateToMovieDetails.onNext(model)
        
        
    }
    
    
    func handleFavouriteButton(index: Int){
        guard  index < favouriteMovieList.count else {return}
        let id = favouriteMovieList[index].details.imdbID ?? ""
        if (realmManager.isFavoured(id: id)){
            realmManager.deleteFavourite(id: id)
        }else{
            realmManager.addFavourite(id: id)
        }
        
        getFavouriteMoviesId()
        self.reloadTableView.onNext(true)
    }
    func getFavouriteMoviesId(){
        favouriteIdsArr = realmManager.getFavouriteFromRealm()
        
        favouriteMovieList.removeAll()
        favouriteMoviesArray.accept([])
        favouriteIdsArr.forEach { (id) in
            getFavouriteMoviesbyId(id:id)
        }
    }
    func getFavouriteMoviesbyId(id: String){
        
        Network.shared.apollo.fetch(query: FindByImdbIdQuery(ImdbId: id)) {[weak self] result in
            switch result{
            case .success(let data):
                // Serialize the response as JSON
                do{
                    guard let json = data.data?.find.movies[0].jsonObject else {return}
                    let serialized = try JSONSerialization.data(withJSONObject: json, options: [])
                    
                    let modelDecoded = try JSONDecoder().decode(Node.self, from: serialized)
                    
                    self?.favouriteMovieList.append(modelDecoded)
                    self?.favouriteMoviesArray.accept(self?.favouriteMovieList ?? [])
                }catch{
                    print("error in getting SimilarMovies data")
                }
                
                
            case .failure(let error):
                print(error)
                
                self?.displayError.onNext("Server Error")
            }
        }
        
        
    }
}
