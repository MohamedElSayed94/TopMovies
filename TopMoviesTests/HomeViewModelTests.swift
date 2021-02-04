//
//  HomeViewModelTests.swift
//  TopMoviesTests
//
//  Created by Mohamed Elsayed on 28/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

@testable import TopMovies
import XCTest
class HomeViewModelTests: XCTestCase {
    var sut: HomeViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HomeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testGetYeatFromDataFail() throws {
        let year1 = sut.getYearFromDate(stringDate: "2013-09-29")
        let year2 = sut.getYearFromDate(stringDate: "abcd")
        XCTAssertFalse(year1 == 2013)
        XCTAssertFalse(year2 == 2013)
    }

    func testGetYeatFromDataSuccess() throws {
        let year1 = sut.getYearFromDate(stringDate: "2013-09-29T18:46:19Z")
        let year2 = sut.getYearFromDate(stringDate: "2020-12-28T12:18:10Z")
        XCTAssertTrue(year1 == 2013)
        XCTAssertTrue(year2 == 2020)
    }

    func testHandleSubTitleFail() throws {
        let node1 = Node(id: 1, poster: "", title: "MovieTitle", overview: "Louram", rating: 8.9, releaseDate: "2020-12-28T12:18:10Z", details: Details(genres: [Genres(name: "Comedy"), Genres(name: "Action")], homepage: "", runtime: 123, budget: 3526540, similar: Similar(edges: [SimilarEdges(node: SimilarNode(details: SimilarDetails(imdbID: "")))])), images: Images(posters: [Posters(image: "")]))
        let subTitle1 = sut.handleSubTitle(modelNode: node1)
        let node2 = Node(id: 1, poster: "", title: "MovieTitle", overview: "Louram", rating: 8.9, releaseDate: "2020-12-28T12:18:10Z", details: Details(genres: [Genres(name: "Comedy"), Genres(name: "Action")], homepage: "", runtime: 123, budget: 3526540, similar: Similar(edges: [SimilarEdges(node: SimilarNode(details: SimilarDetails(imdbID: "")))])), images: Images(posters: [Posters(image: "")]))
        let subTitle2 = sut.handleSubTitle(modelNode: node2)
        XCTAssertFalse(subTitle1 == "2020,Romance")
        XCTAssertFalse(subTitle2 == "2020,Action")
    }

    func testHandleSubTitleSuccess() throws {
        let node1 = Node(id: 1, poster: "", title: "MovieTitle", overview: "Louram", rating: 8.9, releaseDate: "2020-12-28T12:18:10Z", details: Details(genres: [Genres(name: "Comedy"), Genres(name: "Action")], homepage: "", runtime: 123, budget: 3526540, similar: Similar(edges: [SimilarEdges(node: SimilarNode(details: SimilarDetails(imdbID: "")))])), images: Images(posters: [Posters(image: "")]))
        let subTitle1 = sut.handleSubTitle(modelNode: node1)
        let node2 = Node(id: 1, poster: "", title: "MovieTitle", overview: "Louram", rating: 8.9, releaseDate: "2012-12-28T12:18:10Z", details: Details(genres: [Genres(name: "Comedy"), Genres(name: "Romance")], homepage: "", runtime: 123, budget: 3526540, similar: Similar(edges: [SimilarEdges(node: SimilarNode(details: SimilarDetails(imdbID: "")))])), images: Images(posters: [Posters(image: "")]))
        let subTitle2 = sut.handleSubTitle(modelNode: node2)
        XCTAssertTrue(subTitle1 == "2020, Comedy, Action")
        XCTAssertTrue(subTitle2 == "2012, Comedy, Romance")
    }
}
