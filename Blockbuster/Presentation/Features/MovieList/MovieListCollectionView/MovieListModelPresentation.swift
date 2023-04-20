//
//  MovieListItem.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 15/03/23.
//

import Foundation

struct MovieListModelPresentation {
    let id: Int
    let posterPath: String
    let popularity: Double
    let originalTittle: String
    let releaseDate: String
        
}

extension MovieListModelDomain {
    func toPresentation() -> MovieListModelPresentation {
        return MovieListModelPresentation(
            id: self.id,
            posterPath: "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(self.posterPath)",
            popularity: self.voteAverage,
            originalTittle: self.originalTitle,
            releaseDate: self.release_date.format(inputFormat: "yyyy-MM-dd",outputFormat: "d MMM yyyy") ?? self.release_date
        )
    }
}

  
