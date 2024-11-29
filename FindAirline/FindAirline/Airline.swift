import Foundation

struct Airline: Codable {
    let iata: String
    let icao: String
    let fleet: Fleet
    let logoURL: String?
    let name: String

    enum CodingKeys: String, CodingKey {
        case iata, icao, fleet
        case logoURL = "logo_url"
        case name
    }
}

struct Fleet: Codable {
    let A20N: Int?
    let A21N: Int?
    let A320: Int?
    let A321: Int?
    let B752: Int?
    let B763: Int?
    let E290: Int?
    let total: Int
}
