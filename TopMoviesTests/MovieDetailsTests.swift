//
//  MovieDetailsTests.swift
//  TopMoviesTests
//
//  Created by Mohamed Elsayed on 29/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import XCTest
@testable import TopMovies
class MovieDetailsTests: XCTestCase {
    var sut: MovieDetailsViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieDetailsViewModel(details: Node(id: 1, poster: "", title: "MovieTitle", overview: "Louram", rating: 8.9, releaseDate: "2020-12-28T12:18:10Z", details: Details(genres: [Genres(name: "Comedy"),Genres(name: "Action")], homepage: "", runtime: 123, budget: 3526540, similar: Similar(edges: [SimilarEdges(node: SimilarNode(details: SimilarDetails(imdbID: "")))])), images: Images(posters: [Posters(image: "")])))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    func testFormatLargeNumbersFail() throws {
        let large1 = sut.formatLargeNumber(number: 1230)
        let large2 = sut.formatLargeNumber(number: 12)
        XCTAssertFalse(large1 == "123K")
        XCTAssertFalse(large2 == "123M")
    }
    func testFormatLargeNumbersSuccess() throws {
        let large1 = sut.formatLargeNumber(number: 1230)
        let large2 = sut.formatLargeNumber(number: 120000)
        let large3 = sut.formatLargeNumber(number: 12000000)
        XCTAssertTrue(large1 == "1230")
        XCTAssertTrue(large2 == "120K")
        XCTAssertTrue(large3 == "12M")
    }
    

}
