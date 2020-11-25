//
//  TrucoPlayerService.swift
//  TrucoMVP
//
//  Created by Andres Macagno on 24/11/2020.
//

import Foundation

internal class TrucoPlayerService {
    internal var players: [TrucoPlayerModel] = []
    
    internal init() {
        players.append(TrucoPlayerModel(id: 0, playerName: "Player 1", playerScore: 0))
        players.append(TrucoPlayerModel(id: 1, playerName: "Player 2", playerScore: 0))
    }
    
    internal func getPlayer(name: String) -> TrucoPlayerModel? {
        if let player = self.players.first(where: { $0.playerName == name } ) {
            return player
        }
        
        return nil
    }
    
    internal func updatePlayerScore(name: String, points: Int) {
        self.players.first(where: { $0.playerName == name })?.playerScore += points
    }
    
    internal func updatePlayerName(name: String, newName: String) {
        self.players.first(where: { $0.playerName == name })?.playerName = newName
    }
    
    internal func restart() {
        self.players.forEach({ $0.playerScore = 0 })
    }
}
