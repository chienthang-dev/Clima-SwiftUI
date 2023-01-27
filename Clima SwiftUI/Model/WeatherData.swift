//
//  WeatherData.swift
//  Clima SwiftUI
//
//  Created by Vũ Chiến Thắng on 26/01/2023.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Weather: Codable {
    let id: Int

}

struct Main: Codable {
    let temp: Double
    
}
