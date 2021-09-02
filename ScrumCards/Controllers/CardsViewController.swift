//
//  CardsViewController.swift
//  ScrumCards
//
//  Created by Dilhan on 28.11.2020.
//  Copyright © 2020 Dilhan. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
   
    var imageName : String = "notfound.png"
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImage.image = UIImage(named: imageName)
        
        
        //   cardImage.image = UIImage(named: <#T##String#>)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeButtonTapped(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
