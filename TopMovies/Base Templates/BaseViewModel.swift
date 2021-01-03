//
//  BaseViewModel.swift
//
//  Created by Mohamed on 12/23/20.
//

import Foundation
import RxCocoa
import RxSwift
import RealmSwift
class BaseViewModel: ViewModel {
    let realmManager = RealmManager(realmModel: favouriteRealmModel())
    var displayError: PublishSubject<String> = .init()
    var isLoading: PublishSubject<Bool> = .init()
    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    
    
    
}
