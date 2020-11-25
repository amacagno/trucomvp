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
    
    internal func getPlayer(id: Int) -> TrucoPlayerModel? {
        if let player = self.players.first(where: { $0.id == id } ) {
            return player
        }
        
        return nil
    }
    
    internal func updatePlayerScore(id: Int, points: Int) {
        self.players.first(where: { $0.id == id })?.playerScore += points
    }
    
    internal func updatePlayerName(id: Int, newName: String) {
        self.players.first(where: { $0.id == id })?.playerName = newName
    }
    
    internal func restart() {
        self.players.forEach({ $0.playerScore = 0 })
    }
}
