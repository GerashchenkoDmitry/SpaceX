//
//  Rocket.swift
//  SpaceX
//
//  Created by Дмитрий Геращенко on 23.08.2022.
//

import Foundation

struct Rocket {
    var id: String
    let name: String
    let firstFlight: String
    let country: String
    let costPerLaunch: Int
    let firstStage: FirstStage?
}

extension Rocket: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, name
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
    
    /*
     "first_stage" : {
       "thrust_vacuum" : {
         "kN" : 480,
         "lbf" : 110000
       },
       "engines" : 1,
       "thrust_sea_level" : {
         "kN" : 420,
         "lbf" : 94000
       },
       "reusable" : false,
       "fuel_amount_tons" : 44.299999999999997,
       "burn_time_sec" : 169
     }
     */
}

/*
 • дата первого запуска +
 • страна +
 • стоимость запуска +
 • первая ступень - количество двигателей
 • первая ступень - количество топлива в тоннах
 • первая ступень - время сгорания в секундах
 • вторая ступень - количество двигателей
 • вторая ступень - количество топлива в тоннах
 • вторая ступень - время сгорания в секундах
 
 "active" : false,
     "payload_weights" : [
       {
         "id" : "leo",
         "kg" : 450,
         "name" : "Low Earth Orbit",
         "lb" : 992
       }
     ],
     "first_flight" : "2006-03-24",
     "country" : "Republic of the Marshall Islands",
     "company" : "SpaceX",
     "engines" : {
       "number" : 1,
       "layout" : "single",
       "propellant_2" : "RP-1 kerosene",
       "thrust_to_weight" : 96,
       "thrust_sea_level" : {
         "kN" : 420,
         "lbf" : 94000
       },
       "engine_loss_max" : 0,
       "version" : "1C",
       "type" : "merlin",
       "propellant_1" : "liquid oxygen",
       "isp" : {
         "sea_level" : 267,
         "vacuum" : 304
       },
       "thrust_vacuum" : {
         "kN" : 480,
         "lbf" : 110000
       }
     },
     "diameter" : {
       "meters" : 1.6799999999999999,
       "feet" : 5.5
     },
     "landing_legs" : {
       "number" : 0,
       "material" : null
     },
     "second_stage" : {
       "fuel_amount_tons" : 3.3799999999999999,
       "burn_time_sec" : 378,
       "engines" : 1,
       "payloads" : {
         "option_1" : "composite fairing",
         "composite_fairing" : {
           "diameter" : {
             "meters" : 1.5,
             "feet" : 4.9000000000000004
           },
           "height" : {
             "meters" : 3.5,
             "feet" : 11.5
           }
         }
       },
       "thrust" : {
         "kN" : 31,
         "lbf" : 7000
       },
       "reusable" : false
     },
     "stages" : 2,
     "cost_per_launch" : 6700000,
     "wikipedia" : "https:\/\/en.wikipedia.org\/wiki\/Falcon_1",
     "name" : "Falcon 1",
     "type" : "rocket",
     "boosters" : 0,
     "success_rate_pct" : 40,
     "id" : "5e9d0d95eda69955f709d1eb",
     "flickr_images" : [
       "https:\/\/imgur.com\/DaCfMsj.jpg",
       "https:\/\/imgur.com\/azYafd8.jpg"
     ],
     "height" : {
       "meters" : 22.25,
       "feet" : 73
     },
     "mass" : {
       "lb" : 66460,
       "kg" : 30146
     },
     "first_stage" : {
       "thrust_vacuum" : {
         "kN" : 480,
         "lbf" : 110000
       },
       "engines" : 1,
       "thrust_sea_level" : {
         "kN" : 420,
         "lbf" : 94000
       },
       "reusable" : false,
       "fuel_amount_tons" : 44.299999999999997,
       "burn_time_sec" : 169
     },
     "description" : "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth."
   }
 */

