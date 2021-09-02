//
//  WalkthroughContentViewController.swift
//  ScrumCards
//
//  Created by Dilhan on 28.11.2020.
//  Copyright © 2020 Dilhan. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var headingLabel: UILabel! {
    didSet {
               headingLabel.numberOfLines = 0
           }
    }
    @IBOutlet weak var detailLabel: UILabel! {
    didSet {
                detailLabel.numberOfLines = 0
            }
     }
    
    var index = 0
    var heading = ""
    var detail = ""
    var imageTitle = ""
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        headingLabel.text = heading
        detailLabel.text = detail
        imageContent.image = UIImage(named: imageTitle)
    }
}
