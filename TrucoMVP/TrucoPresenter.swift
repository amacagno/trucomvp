//
//  TrucoPresenter.swift
//  TrucoMVP
//
//  Created by Andres Macagno on 24/11/2020.
//

import Foundation

internal class TrucoPresenter {
    private let trucoPlayerService: TrucoPlayerService
    weak private var trucoViewDelegate: TrucoViewDelegate?
    
    internal init(service: TrucoPlayerService) {
        self.trucoPlayerService = service
    }
    
    internal func setDelegate(_ delegate: TrucoViewDelegate?) {
        self.trucoViewDelegate = delegate
    }
    
    internal func updateScore(playerName: String, type: String) {
        self.trucoPlayerService.updatePlayerScore(name: playerName, score: sumOrSub(type))
        
        if let player = self.trucoPlayerService.getPlayer(name: playerName) {
            if player.id == 0 {
                self.trucoViewDelegate?.updatePlayerOneScore(newScore: String(player.playerScore))
            } else {
                self.trucoViewDelegate?.updatePlayerTwoScore(newScore: String(player.playerScore))
            }
        }
    }
    
    internal func updateName(currentName: String, newName: String) {
        self.trucoPlayerService.updatePlayerName(name: currentName, newName: newName)
        
        if let player = self.trucoPlayerService.getPlayer(name: newName) {
            if player.id == 0 {
                self.trucoViewDelegate?.updatePlayerOneName(newName: player.playerName)
            } else {
                self.trucoViewDelegate?.updatePlayerTwoName(newName: player.playerName)
            }
        }
    }
    
    internal func restart() {
        self.trucoPlayerService.restart()
        self.trucoViewDelegate?.updatePlayerOneScore(newScore: "0")
        self.trucoViewDelegate?.updatePlayerTwoScore(newScore: "0")
    }
    
    private func sumOrSub(_ type: String) -> Int {
        var update: Int
        
        switch type {
        case "sum":
            update = 1
        case "substract":
            update = -1
        default:
            update = 0
        }
        
        return update
    }
}
