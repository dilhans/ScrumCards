//
//  WalkthroughViewController.swift
//  ScrumCards
//
//  Created by Dilhan on 28.11.2020.
//  Copyright © 2020 Dilhan. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    var walkthroughPageViewController: WalkthrougPageViewController?
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
                
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                self.navigationController?.popViewController(animated: false)
                
            default: break
            }
        }
        updateUI()
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
          updateUI()
      }
    
    func updateUI() {
         
        if let index = walkthroughPageViewController?.currentIndex {
              switch index {
              case 0...1:
                  nextButton.setTitle("NEXT", for: .normal)
                  skipButton.isHidden = false
              
              case 2:
                  nextButton.setTitle("GET STARTED", for: .normal)
                  skipButton.isHidden = true
                  
              default: break
              }
              
              pageControl.currentPage = index
          }
      }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        self.navigationController?.popViewController(animated: false)
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          let destination = segue.destination
          if let pageViewController = destination as? WalkthrougPageViewController {
              walkthroughPageViewController = pageViewController
              walkthroughPageViewController?.walkthroughDelegate = self
          }
      }

}
