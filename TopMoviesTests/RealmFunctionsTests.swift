//
//  RealmFunctionsTests.swift
//  TopMoviesTests
//
//  Created by Mohamed Elsayed on 03/01/2021.
//  Copyright © 2021 Mohamed Elsayed. All rights reserved.
//

import XCTest
import RealmSwift
@testable import TopMovies
class RealmFunctionsTests: XCTestCase {

    var sut: RealmManager!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = RealmManager(realmModel: testFavouriteRealmModel())
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        removeAllFavourites()
        sut = nil
    }
    func testAddNewFavouriteAndGetNewFavourite() throws {
        removeAllFavourites()
        sut.addFavourite(id: "1")
        let favArray = sut.getFavouriteFromRealm()
        let favouriteArrCount = favArray.count
        
        XCTAssertFalse(favouriteArrCount == 0)
        XCTAssertTrue(favouriteArrCount == 1)
        
        
        let isInFavourites = favArray.contains("1")
        
        XCTAssertFalse(isInFavourites == false)
        XCTAssertTrue(isInFavourites == true)
    }
    
    func testDeleteFavourite() throws {
        removeAllFavourites()
        var favArray = sut.getFavouriteFromRealm()
        var favouriteArrCount = favArray.count
        
        XCTAssertTrue(favouriteArrCount == 0)
        
        sut.addFavourite(id: "22")
        favArray = sut.getFavouriteFromRealm()
        favouriteArrCount = favArray.count
        
        XCTAssertTrue(favouriteArrCount == 1)
    }
    
    func testIsfavoured() throws{
        removeAllFavourites()
        sut.addFavourite(id: "13")
        let isFavoured1 = sut.isFavoured(id: "13")
        let isFavoured2 = sut.isFavoured(id: "9")
        XCTAssertTrue(isFavoured1 == true)
        XCTAssertFalse(isFavoured2 == true)
    }
    
    
    
    
    func removeAllFavourites(){
        var idArray = [String]()
        idArray = sut.getFavouriteFromRealm()
        idArray.forEach { (id) in
            sut.deleteFavourite(id: id)
        }
    }
    
}
