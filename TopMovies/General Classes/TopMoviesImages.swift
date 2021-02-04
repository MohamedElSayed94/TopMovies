//
//  TopMoviesImages.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 04/01/2021.
//  Copyright © 2021 Mohamed Elsayed. All rights reserved.
//

import Foundation
import UIKit

enum TopMoviesImages {
    case filledHeart
    case emptyHeart
    case clapboard

    func image() -> UIImage {
        switch self {
        case .filledHeart:
            guard let image = UIImage(named: "filledHeart") else { return UIImage() }
            return image
        case .emptyHeart:
            guard let image = UIImage(named: "emptyHeart") else { return UIImage() }
            return image
        case .clapboard:
            guard let image = UIImage(named: "clapboard") else { return UIImage() }
            return image
        }
    }
}
