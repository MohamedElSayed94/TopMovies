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
    let realm = try! Realm()
    var displayError: PublishSubject<String> = .init()
    var isLoading: PublishSubject<Bool> = .init()
    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    func addFavourite(id: String){
        let model = favouriteRealmModel()
        model.id = id
        do{
            try realm.write {
                if (!isFavoured(id: id)){
                    realm.add(model)
                }
                
            }
        }catch{
            print("error in adding data to realm")
        }
    }
    func deleteFavourite(id: String){
        
        do{
            try realm.write {
                realm.delete(realm.objects(favouriteRealmModel.self).filter("id=%@",id))
            }
        }catch{
            print("error in adding data to realm")
        }
    }
    
    func getFavouriteFromRealm() -> [String]{
        var arr = [String]()
        let model = realm.objects(favouriteRealmModel.self)
        model.forEach { (movie) in
            arr.append(movie.id)
        }
        return arr
    }
    func isFavoured(id:String) -> Bool{
        let favArr = realm.objects(favouriteRealmModel.self)
        let model = favouriteRealmModel()
        model.id = id
        if favArr.contains(where: { $0.id == id }){
            return true
        }else{
            return false
        }
    }
    
    
    
}
