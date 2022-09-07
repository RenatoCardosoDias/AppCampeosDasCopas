//
//  WorldCup.swift
//  AppCampeosDasCopas
//
//  Created by Renato on 07/09/22.
//

import Foundation

struct WordCup: Codable{
    let year: Int
    let contry: String
    let winner: String
    let vice: String
    let winnerScore: String
    let viceScore: String
    let matches: [Match]
}

struct Match: Codable {
    let stage: String
    let games: [Game]
}

struct Game: Codable {
    let home: String
    let away : String
    let score: String
    let date: String
}
