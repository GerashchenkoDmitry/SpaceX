//
//  Rocket.swift
//  SpaceX
//
//  Created by Дмитрий Геращенко on 23.08.2022.
//

import Foundation

struct Rocket {
    var id: String
//    let image: String
    let name: String
    let firstFlight: String
    let country: String
    let costPerLaunch: Int
    let firstStage: FirstStage?
}

extension Rocket: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
//        case image = "flickr_images"
        case name
        case firstFlight = "first_flight"
        case country
        case costPerLaunch = "cost_per_launch"
        case firstStage = "first_stage"
    }
}

struct FirstStage {
    let engines: Int?
    let fuelAmountTons: Float?
    let burnTimeSec: Int?
}

extension FirstStage: Decodable {
    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
}

struct Images {
    let images: [String]
}

extension Images: Decodable {
    enum CodingKeys: String, CodingKey {
        case images = "flickr_images"
    }
}
