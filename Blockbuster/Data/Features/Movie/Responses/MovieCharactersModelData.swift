//
//  MovieCharactersModelData.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 10/04/23.
//

import Foundation

struct CharactersModelData : Codable {
    let id : Int
    let cast : [Character]
}

struct Character : Codable {
    let id : Int
    let originalName : String
    let profilePath : String?
    let character : String
}

extension Character {
    func toDomain() -> CharacterModelDomain {
        return CharacterModelDomain(
            profilePath: self.profilePath,
            name: self.originalName,
            alias: self.character
        )
    }
}
