//
//  ViewController.swift
//  TrucoMVP
//
//  Created by Andres Macagno on 24/11/2020.
//

import UIKit

class TrucoViewController: UIViewController {
    private let trucoPresenter = TrucoPresenter(service: TrucoPlayerService())
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var scoreP1Label: UILabel!
    @IBOutlet weak var scoreP2Label: UILabel!
    @IBOutlet weak var player1Field: UITextField!
    @IBOutlet weak var player2Field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.trucoPresenter.setDelegate(self)
        self.setupUI()
        self.addGesture()
    }
    
    func setupUI() {
        self.titleLabel.text = "ANOTADOR TRUCO"
        self.titleLabel.textColor = .blue
        
        self.player1Label.textColor = .red
        self.player2Label.textColor = .red
        
        self.scoreP1Label.textColor = .green
        self.scoreP2Label.textColor = .green
    }
    
    func addGesture() {
        let tapBackground = UITapGestureRecognizer(target: self, action: #selector(self.backgroundTapped(_:)))
        self.view.addGestureRecognizer(tapBackground)
    }
    
    @objc func backgroundTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func onTouchPlusP1(_ sender: Any) {
        self.trucoPresenter.updateScore(id: 0, points: 1)
    }
    
    @IBAction func onTouchPlusP2(_ sender: Any) {
        self.trucoPresenter.updateScore(id: 1, points: 1)
    }
    
    @IBAction func onTouchMinusP1(_ sender: Any) {
        self.trucoPresenter.updateScore(id: 0, points: -1)
    }
    
    @IBAction func onTouchMinusP2(_ sender: Any) {
        self.trucoPresenter.updateScore(id: 1, points: -1)
    }
    
    @IBAction func onTouchRefresh(_ sender: Any) {
        self.trucoPresenter.updateName(id: 0, newName: self.player1Field.text ?? "")
        self.trucoPresenter.updateName(id: 1, newName: self.player2Field.text ?? "")
        self.player1Field.text = ""
        self.player2Field.text = ""
        self.view.endEditing(true)
    }
    
    @IBAction func onTouchRestart(_ sender: Any) {
        self.trucoPresenter.restart()
    }
    
    @IBAction func onTouchFaq(_ sender: Any) {
        let faqVC = self.storyboard?.instantiateViewController(identifier: "FaqViewController") as! FaqViewController
        self.navigationController?.pushViewController(faqVC, animated: true)
    }
}

extension TrucoViewController: TrucoViewDelegate {
    func updatePlayerOneName(newName: String) {
        self.player1Label.text = newName
    }
    
    func updatePlayerTwoName(newName: String) {
        self.player2Label.text = newName
    }
    
    func updatePlayerOneScore(newScore: String) {
        self.scoreP1Label.text = newScore
    }
    
    func updatePlayerTwoScore(newScore: String) {
        self.scoreP2Label.text = newScore
    }
}
