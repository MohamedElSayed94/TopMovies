//
//  CartNavigator.swift
//  PizzaWorld
//
//  Created by Mohamed on 10/17/20.
//


import Foundation
import UIKit

class FavouriteNavigator: Navigator {
    var coordinator: Coordinator
    
    enum Destination {
        case favouritesMenu
    }
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func viewController(for destination: Destination, coordinator: Coordinator) -> UIViewController {
        switch destination {
        case .favouritesMenu:
            let viewModel = FavouritesViewModel()
            let view = FavouritesViewController(viewModel: viewModel, coordinator: coordinator)
            return view
            
        }
    }
}
