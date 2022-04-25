//
//  HeroDecoder.swift
//  HeroGamePlanetveracity
//
//  Created by Pravin Kumar on 25/03/22.
//

import Foundation
struct HeroStats : Decodable{
    let localized_name : String
    let primary_attr : String
    let attack_type : String
    let legs : Int
    let img : String
}
