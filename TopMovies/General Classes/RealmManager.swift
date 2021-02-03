//
//  RealmManager.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 03/01/2021.
//  Copyright © 2021 Mohamed Elsayed. All rights reserved.
//

import Foundation
import RealmSwift


protocol RealmClasses: Object{
    
    
}
enum TestOrProduction{
    case test
    case production
}

class RealmManager {
    var realmCase: TestOrProduction
    
    
    
    
    init(realmModel: RealmClasses) {
        
        if type(of: realmModel)  == type(of: favouriteRealmModel()) {
            realmCase = .production
        }else if type(of: realmModel) == type(of: testFavouriteRealmModel()){
            realmCase = .test
        }else{
            realmCase = .test
        }
    }

    func addFavourite(id: String){
        
        switch realmCase{
        case .production:
            let model = favouriteRealmModel()
            model.id = id
            do{
                let realm = try Realm()
                try realm.write {
                    if (!isFavoured(id: id)){
                        realm.add(model)
                    }
                    
                }
            }catch{
                print("error in adding data to realm")
            }
        case .test:
            let model = testFavouriteRealmModel()
            model.id = id
            do{
                let realm = try Realm()
                try realm.write {
                    if (!isFavoured(id: id)){
                        realm.add(model)
                    }
                    
                }
            }catch{
                print("error in adding data to realm")
            }
            
        }
        
    }
    
    func deleteFavourite(id: String){
        
        do{
            let realm = try Realm()
            try realm.write {
                switch realmCase{
                case .production:
                    realm.delete(realm.objects(favouriteRealmModel.self).filter("id=%@",id))
                case .test:
                    realm.delete(realm.objects(testFavouriteRealmModel.self).filter("id=%@",id))
                    
                }
                
            }
        }catch{
            print("error in adding data to realm")
        }
    }
    
    func getFavouriteFromRealm() -> [String]{
        var arr = [String]()
        do{
            let realm = try Realm()
            switch realmCase{
            case .production:
                let model: Results<favouriteRealmModel>
                model = realm.objects(favouriteRealmModel.self )
                model.forEach { (movie) in
                    arr.append(movie.id)
                }
            case .test:
                let model: Results<testFavouriteRealmModel>
                model = realm.objects(testFavouriteRealmModel.self )
                model.forEach { (movie) in
                    arr.append(movie.id)
                }
                
            }
            
            return arr
        }catch{
            return [String]()
        }
        
    }
    func isFavoured(id:String) -> Bool{
        do{
            let realm = try Realm()
            switch realmCase{
            case .production:
                let favArr = realm.objects(favouriteRealmModel.self)
                let model = favouriteRealmModel()
                model.id = id
                if favArr.contains(where: { $0.id == id }){
                    return true
                }else{
                    return false
                }
            case .test:
                let favArr = realm.objects(testFavouriteRealmModel.self)
                let model = testFavouriteRealmModel()
                model.id = id
                if favArr.contains(where: { $0.id == id }){
                    return true
                }else{
                    return false
                }
            }
            
        }catch{
            return Bool()
        }
        
    }
    
}

