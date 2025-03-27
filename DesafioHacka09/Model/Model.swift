//
//  Model.swift
//  DesafioHacka09
//
//  Created by Mateus Ottoni on 26/03/25.
//

import Foundation

// Struct básica do personagem
struct HaPo: Codable, Identifiable {
    let id: String
    let name: String?
    let alternate_names: [String]?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool?
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let wand: Wand
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alternate_actors: [String]?
    let alive: Bool?
    let image: String?
}
// Struct básica da varinha
struct Wand: Codable {
    let wood: String?
    let core: String?
    let length: Double?
}
