//
//  Model.swift
//  DesafioHacka10
//
//  Created by Mateus Ottoni on 27/03/25.
//

import Foundation

// Struct básica do personagem
struct SDV: Codable {
    let _id:                    String
    let _rev:                   String
    let name:                   String
    let photo:                  String?
    let birthday_day:           Int?
    let birthday_season:        String?
    let lives_in:               String?
    let address:                String?
    let family:                 [String]?
    let marriage:               Bool?
    let clinic_visit_day:       Int?
    let clinic_visit_season:    String?
    let loved_gifts:            [String]?
}
