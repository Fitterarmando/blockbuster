//
//  MovieListModelData.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 29/03/23.
//

import Foundation

struct MoviesModelData : Codable {
    let results : [DetailsMovie]
}

struct DetailsMovie : Codable {
    let id : Int
    let originalTitle : String
    let posterPath : String
    let releaseDate : String
    let video : Bool
    let voteAverage : Double
}

extension DetailsMovie {
    func toDomain() -> MovieListModelDomain {
        return MovieListModelDomain(
            id: self.id,
            originalTitle: self.originalTitle,
            posterPath: self.posterPath,
            release_date: self.releaseDate,
            voteAverage: self.voteAverage
        )
    }
}


