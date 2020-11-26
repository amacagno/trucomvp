//
//  FaqViewController.swift
//  TrucoMVP
//
//  Created by Andres Macagno on 25/11/2020.
//

import Foundation
import UIKit

class FaqViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        self.titleLabel.text = "Probando segundo ViewController"
    }
}
