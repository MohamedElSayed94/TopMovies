//
//  StringModification.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 03/02/2021.
//  Copyright © 2021 Mohamed Elsayed. All rights reserved.
//

import Foundation

struct StringModification {
    
    func getYearFromDate(stringDate: String) -> Int{
        var age: Int? {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            guard let date = dateFormater.date(from: stringDate) else {
                return nil
            }
            let calendar = Calendar.current
            let age = calendar.component(.year, from: date)
            return age
        }
        return age ?? 0
    }
    
    func handleSubTitle(modelNode: Node?) -> String{
        var genres = ""
        modelNode?.details.genres.forEach { (genre) in
            genres += ", \(genre.name)"
        }
        return "\(self.getYearFromDate(stringDate: modelNode?.releaseDate ?? ""))\(genres)"
    }
    
    
}
