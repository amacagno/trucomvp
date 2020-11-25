//
//  TrucoViewDelegate.swift
//  TrucoMVP
//
//  Created by Andres Macagno on 24/11/2020.
//

import Foundation

internal protocol TrucoViewDelegate: AnyObject {
    func updatePlayerOneName(newName: String)
    func updatePlayerTwoName(newName: String)
    func updatePlayerOneScore(newScore: String)
    func updatePlayerTwoScore(newScore: String)
}
