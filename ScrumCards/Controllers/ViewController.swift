//
//  ViewController.swift
//  ScrumCards
//
//  Created by Dilhan on 27.11.2020.
//  Copyright © 2020 Dilhan. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var cardInfo: UILabel!
    @IBOutlet private var sizeZero: UIButton!
    @IBOutlet private var sizeHalf: UIButton!
    @IBOutlet private var size1: UIButton!
    @IBOutlet private var size2: UIButton!
    @IBOutlet private var size3: UIButton!
    @IBOutlet private var size5: UIButton!
    @IBOutlet private var size8: UIButton!
    @IBOutlet private var sizeUnknown: UIButton!
    @IBOutlet private weak var shakeLabel: UILabel!
    private let scrumCard = ScrumCard()
    private var buttonTitle : String = "unknown"
    
    @IBAction private func infoButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToInfo", sender: self)
    }
    
    private func updateUI() {
        sizeZero.isSelected = false
        sizeZero.layer.borderWidth = 0
        
        sizeHalf.isSelected = false
        sizeHalf.layer.borderWidth = 0
        
        size1.isSelected = false
        size1.layer.borderWidth = 0
        
        size2.isSelected = false
        size2.layer.borderWidth = 0
        
        size3.isSelected = false
        size3.layer.borderWidth = 0
        
        size5.isSelected = false
        size5.layer.borderWidth = 0
        
        size8.isSelected = false
        size8.layer.borderWidth = 0
        
        sizeUnknown.isSelected = false
        sizeUnknown.layer.borderWidth = 0
    }
    
    @IBAction private func cardSelected(_ sender: UIButton) {
        updateUI()
        sender.isSelected = true
        sender.layer.borderWidth = 5
        sender.layer.borderColor = UIColor.orange.cgColor
        buttonTitle = scrumCard.title[Int(sender.currentTitle!)!]
        
        if sender.tag < scrumCard.detail.count {
            cardInfo.text = scrumCard.detail[sender.tag]
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            if buttonTitle != "unknown" {
                self.performSegue(withIdentifier: "goToCard", sender: self)
                updateUI()
            } else {
                shakeLabel.text = "Please first select a card"
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                    self.shakeLabel.text = "Shake to reveal"
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCard", let destinationVC = segue.destination as? CardsViewController {
            destinationVC.imageName = buttonTitle + "_big.png"
        }
    }
}
