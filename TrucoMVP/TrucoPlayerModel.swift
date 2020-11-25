//
//  TrucoPlayerModel.swift
//  TrucoMVP
//
//  Created by Andres Macagno on 24/11/2020.
//

import Foundation

internal class TrucoPlayerModel {
    var id: Int
    var playerName: String
    var playerScore: Int
    
    internal init(id: Int, playerName: String, playerScore: Int) {
        self.id = id
        self.playerName = playerName
        self.playerScore = playerScore
    }
}
