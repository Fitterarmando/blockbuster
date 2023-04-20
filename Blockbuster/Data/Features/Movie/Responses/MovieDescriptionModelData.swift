//
//  MovieDescriptionModelData.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 29/03/23.
//

import Foundation

struct MovieDescriptionModelData : Codable {
    let adult : Bool
    //let backdropPath : String
    let belongsToCollection : Collection?
    let budget : Int
    let genres : [Genres]
    let homepage: String?
    let id : Int
    let imdbId : String
    let originalLanguage : String
    let originalTitle : String
    let overview : String
    let popularity: Double
    let posterPath : String
    let productionCompanies : [Production]
    let productionCountries : [ProductionCountries]
    let releaseDate : String
    let revenue : Int
    let runtime : Int
    let spokenLanguages : [SpokenLanguages]
    let status : String
    let tagline : String
    let title : String
    let video : Bool
    let voteAverage : Double
    let voteCount : Int
    
    
    
    struct Collection : Codable {
        let id : Int
        let name : String
        let posterPath : String?
        let backdropPath : String?
    
    }
    
    struct Genres : Codable {
        let id : Int
        let name : String
    }
    
    struct Production : Codable {
        let id : Int
        let logoPath : String?
        let name : String
        let originCountry : String
    }
    
    struct ProductionCountries : Codable {
        let iso31661 : String
        let name : String
    }
    
    struct SpokenLanguages : Codable {
        let englishName : String
        let iso6391 : String
        let name : String
    }
    
}


extension MovieDescriptionModelData {
    func toDomain() -> MovieDescriptionModel {
        return MovieDescriptionModel(
            page: self.homepage,
            id: self.id,
            original_language: self.originalLanguage,
            original_title: self.originalTitle,
            runTime: self.runtime,
            overview: self.overview,
            popularity: self.popularity,
            poster_path: self.posterPath,
            release_date: self.releaseDate,
            title: self.title,
            video: self.video,
            vote_average: self.voteAverage,
            vote_count: self.voteCount,
            genre : self.genres.map { genre in genre.name }
        )
    }
}



