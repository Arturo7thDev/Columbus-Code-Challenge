//
//  Timer.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation

// MARK: - Timer
struct Timer: Codable {
    let product, timerInit: String?
    let dataseries: [Datasery]?

    enum CodingKeys: String, CodingKey {
        case product
        case timerInit = "init"
        case dataseries
    }
}

// MARK: - Datasery
struct Datasery: Codable {
    let timepoint, cloudcover, seeing, transparency: Int?
    let liftedIndex, rh2M: Int?
    let wind10M: Wind10M?
    let temp2M: Int?
    let precType: String?

    enum CodingKeys: String, CodingKey {
        case timepoint, cloudcover, seeing, transparency
        case liftedIndex = "lifted_index"
        case rh2M = "rh2m"
        case wind10M = "wind10m"
        case temp2M = "temp2m"
        case precType = "prec_type"
    }
}

enum PrecType: String, Codable {
    case none = "none"
    case rain = "rain"
}

// MARK: - Wind10M
struct Wind10M: Codable {
    let direction: String
    let speed: Int?
}

enum Direction: String, Codable {
    case n = "N"
    case ne = "NE"
    case sw = "SW"
}
