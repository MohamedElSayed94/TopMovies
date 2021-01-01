//
//  Apollo.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 26/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import Foundation
import Apollo


class Network{
    static let shared = Network()
    lazy var  apollo = ApolloClient(url: URL(string: "https://tmdb.apps.quintero.io/")!)
}
