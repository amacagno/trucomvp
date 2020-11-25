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
    
    internal func updateScore(id: Int, points: Int) {
        self.trucoPlayerService.updatePlayerScore(id: id, points: points)
        let playerScore = self.trucoPlayerService.getPlayer(id: id)?.playerScore ?? 0
        
        if id == 0 {
            self.trucoViewDelegate?.updatePlayerOneScore(newScore: String(playerScore))
        } else {
            self.trucoViewDelegate?.updatePlayerTwoScore(newScore: String(playerScore))
        }
    }
    
    internal func updateName(id: Int, newName: String) {
        self.trucoPlayerService.updatePlayerName(id: id, newName: newName)
        
        if id == 0 {
            self.trucoViewDelegate?.updatePlayerOneName(newName: newName)
        } else {
            self.trucoViewDelegate?.updatePlayerTwoName(newName: newName)
        }
    }
    
    internal func restart() {
        self.trucoPlayerService.restart()
        self.trucoViewDelegate?.updatePlayerOneScore(newScore: "0")
        self.trucoViewDelegate?.updatePlayerTwoScore(newScore: "0")
    }
}
