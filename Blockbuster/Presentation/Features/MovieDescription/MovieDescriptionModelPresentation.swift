//
//  MovieDescriptionPresentation.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 30/03/23.
//

import Foundation

struct MovieDescriptionModelPresentation {
    let movieImage: String?
    let title: String
    let date: String
    let genre: [String]
    let duration: String
    let description: String
}

extension MovieDescriptionModel {
    func toPresentation() -> MovieDescriptionModelPresentation {
        return MovieDescriptionModelPresentation(
            movieImage: "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(self.poster_path)",
            title: self.title,
            date: self.release_date.format(inputFormat: "yyyy-MM-dd", outputFormat: "d MMMM yyyy") ?? self.release_date,
            genre: self.genre,
            duration: self.runTime.hourAndMinutes(),
            description: self.overview)
    }
}
