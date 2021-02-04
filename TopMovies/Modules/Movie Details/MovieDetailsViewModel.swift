//
//  MovieDetailsViewModel.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 27/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MovieDetailsViewModel: BaseViewModel {
    var details: Node
    var similarMoviesArray: BehaviorRelay<[Node]> = .init(value: [])
    var similarMovieList = [Node]()
    var reloadSimilar: PublishSubject<Bool> = .init()
    var onDismiss: PublishSubject<Bool> = .init()
    
    init(details: Node) {
        self.details = details
    }
    
    func getSimilarMovies() {
        let imdbTDsEdges = details.details.similar.edges
        imdbTDsEdges.forEach { edge in
            getSimilarMoviesbyId(id: edge.node?.details?.imdbID ?? "")
        }
    }
    
    func getSimilarMoviesbyId(id: String) {
        Network.shared.apollo.fetch(query: FindByImdbIdQuery(ImdbId: id)) { [weak self] result in
            switch result {
            case .success(let data):
                // Serialize the response as JSON
                do {
                    guard let json = data.data?.find.movies[0].jsonObject else { return }
                    let serialized = try JSONSerialization.data(withJSONObject: json, options: [])
                    
                    let modelDecoded = try JSONDecoder().decode(Node.self, from: serialized)
                    
                    self?.similarMovieList.append(modelDecoded)
                    self?.similarMoviesArray.accept(self?.similarMovieList ?? [])
                } catch {
                    print("error in getting SimilarMovies data")
                }
                
            case .failure(let error):
                print(error)
                self?.displayError.onNext("Server Error")
            }
        }
    }

    func similarMovieDidSelect(_ indexPath: IndexPath) {
        details = similarMovieList[indexPath.row]
    }
    
    func formatLargeNumber(number: Int) -> String {
        var doubleNumber = Double(number)
        var kmFormatted: String {
            if doubleNumber >= 100000, doubleNumber <= 999999 {
                return String(format: "%.2fK", locale: Locale.current, doubleNumber/1000).replacingOccurrences(of: ".00", with: "")
            }
            if doubleNumber > 999999 {
                return String(format: "%.2fM", locale: Locale.current, doubleNumber/1000000).replacingOccurrences(of: ".00", with: "")
            }
            return String(format: "%.2f", doubleNumber).replacingOccurrences(of: ".00", with: "")
        }
        return kmFormatted
    }

    func handleDetailsFavouriteButton() {
        let id = details.details.imdbID ?? ""
        if realmManager.isFavoured(id: id) {
            realmManager.deleteFavourite(id: id)
        } else {
            realmManager.addFavourite(id: id)
        }
    }

    func handleFavouriteSimilarButton(index: Int) {
        let id = similarMovieList[index].details.imdbID ?? ""
        if realmManager.isFavoured(id: id) {
            realmManager.deleteFavourite(id: id)
        } else {
            realmManager.addFavourite(id: id)
        }
        reloadSimilar.onNext(true)
    }
}
