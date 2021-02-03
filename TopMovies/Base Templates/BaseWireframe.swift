//
//  BaseWireframe.swift
//
//  Created by Mohamed on 12/23/20.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import RealmSwift
protocol ViewModel {
    
}

class BaseWireframe<T: BaseViewModel>: UIViewController {
    var viewModel: T!
    var coordinator: Coordinator!
    
    
    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(named: "darkColor")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        bind(viewModel: viewModel)
        bindStates()
    }
    
    init(viewModel: T, coordinator: Coordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    func displayError(text: String){
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        let cancelButton = UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    func bind(viewModel: T){
        fatalError("Please override bind function")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bindStates(){
        viewModel.displayError.subscribe(onNext: {[weak self] (text) in
                                            self?.displayError(text: text) }).disposed(by: disposeBag)
        
        
        viewModel.isLoading.subscribe { [weak self] (isLoading) in
            guard let isLoading = isLoading.element else { return }
            if(isLoading){
                LoadingIndicator.start(vc: self ?? UIViewController())
                
            } else {
                LoadingIndicator.stop()
            }
        }.disposed(by: disposeBag)
        
        
    }
    
    
    
}


