//
//  MainNavigator.swift
//  PizzaWorld
//
//  Created by Mohamed on 10/15/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
class MainNavigator: Navigator {
    var coordinator: Coordinator
    
    enum Destination {
        case home
        case movieDetails(ViewModel: MovieDetailsViewModel)
    }
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func viewController(for destination: Destination, coordinator: Coordinator) -> UIViewController {
        switch destination {
        case .home:
            let viewModel = HomeViewModel()
            let view = HomeViewController(viewModel: viewModel, coordinator: coordinator)
            return view
        case .movieDetails(let detailsViewModel):
            
            let view = MovieDetailsViewController(viewModel: detailsViewModel, coordinator: coordinator)
            return view
            
        }
    }
}
