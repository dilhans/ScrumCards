//
//  WalkthrougPageViewController.swift
//  ScrumCards
//
//  Created by Dilhan on 28.11.2020.
//  Copyright © 2020 Dilhan. All rights reserved.
//

import UIKit

protocol WalkthroughPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}


class WalkthrougPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
   
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?

    var pageHeadings = ["Prepare for planning", "Select your size card", "Shake to reveal your card"]
   
    var pageDetails = ["Share this app with your team and use the cards for estimating your backlog items.", "Select the card that represents the size of a backlog item. Wait until everyone is ready.", "Shake your phone to reveal your selected card."]
   
    var pageImages = ["onboarding1", "onboarding2", "onboarding3"]
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self

        
        if let startingViewController = contentViewController(at: 0){
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }

    }
    
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
         var index = (viewController as! WalkthroughContentViewController).index
         index -= 1
         
         return contentViewController(at: index)
     }
     
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
         var index = (viewController as! WalkthroughContentViewController).index
         index += 1
         
         return contentViewController(at: index)
     }
     
    func contentViewController (at index : Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.detail = pageDetails[index]
            pageContentViewController.imageTitle = pageImages[index]
            
            pageContentViewController.index = index
            return pageContentViewController
        }
        
        return nil
    }
   
    func forwardPage() {
         currentIndex += 1
         if let nextViewController = contentViewController(at: currentIndex) {
             setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
         }
     }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
         if completed {
             if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController {
                 currentIndex = contentViewController.index
                 
                 walkthroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
             }
         }
     }
}
