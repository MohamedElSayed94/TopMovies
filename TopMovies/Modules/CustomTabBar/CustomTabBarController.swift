//
//  CustomTabBarController.swift
//  PizzaWorld
//
//  Created by Osama on 10/15/20.
//

import UIKit

class CustomTabBarController: UITabBarController {
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum TabBarItems: Int, CaseIterable {
        case Home
        case Favourite
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(UITabBar(), forKey: "tabBar")
        setupTabBarItems()
        setupTabBarUI()
    }
    
    
    
    func setupTabBarUI(){
        tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6847319732)
        tabBar.barTintColor = .black
    }
    
    private func setupTabBarItems(){
        self.viewControllers = TabBarItems.allCases.map({
            let view = viewControllerForTabBarItem($0)
            let navigation = UINavigationController(rootViewController: view)
            return navigation
        })
    }
    
    
    
    func viewControllerForTabBarItem(_ item: TabBarItems) -> UIViewController{
        switch item {
        case .Home:
            let view = coordinator.Main.viewController(for: .home, coordinator: coordinator)
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .Favourite:
            let view = coordinator.Favourites.viewController(for: .favouritesMenu, coordinator: coordinator)
            view.tabBarItem = tabBarItem(for: item)
            return view
            
        }
    }
    
    private func tabBarItem(for item: TabBarItems) -> UITabBarItem?{
        let tabBarItem: UITabBarItem
        switch item {
        case .Home:
            tabBarItem = .init(title: "Home", image: #imageLiteral(resourceName: "unselectedHomeIcon"), selectedImage: #imageLiteral(resourceName: "homeIcon"))
        case .Favourite:
            tabBarItem = .init(title: "Favourites", image: #imageLiteral(resourceName: "unselectedFavouritesIcon"), selectedImage: #imageLiteral(resourceName: "favouriteIcon"))
        }
        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 15)
        tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
        
        return tabBarItem
    }
    
}
