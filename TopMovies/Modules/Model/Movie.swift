//
//  Movie.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 26/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import Foundation
import RealmSwift
struct Movie:Decodable {
    var totalCount: Int
    var pageInfo: PageInfo
    var edges: [Edges]?
}

struct PageInfo:Decodable {
    var hasNextPage: Bool
    var endCursor: String
}

struct Edges:Decodable {
    var node: Node?
}

struct Node:Decodable {
    var id: Int
    var poster: String?
    var title: String
    var overview: String
    var rating: Float
    var releaseDate: String?
    var details: Details
    var images: Images
}
struct Details:Decodable {
    var imdbID: String?
    var genres: [Genres]
    var homepage: String?
    var runtime: Int
    var budget: Int
    var similar: Similar
}
struct Similar:Decodable {
    var edges: [SimilarEdges]
}
struct SimilarEdges:Decodable {
    var node: SimilarNode?
    var defualtNode: SimilarNode { node ?? SimilarNode(details: nil)}
}


struct SimilarNode:Decodable {
    
    var details: SimilarDetails?
    
}
struct SimilarDetails:Decodable {
    var imdbID: String?
}




struct Genres:Decodable {
    var name: String
}

struct Images:Decodable {
    var posters: [Posters]
}

struct Posters:Decodable {
    var image: String
}


//Realm Model
class favouriteRealmModel: Object, RealmClasses {
    
    @objc dynamic var id = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
class testFavouriteRealmModel: Object, RealmClasses {
    @objc dynamic var id = ""
    
    override class func primaryKey() -> String {
        return "id"
    }
    
}
