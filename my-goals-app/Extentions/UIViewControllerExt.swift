//
//  UIViewControllerExt.swift
//  my-goals-app
//
//  Created by Sunimal Herath on 16/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // create a function to present the passing ViewController
    func presentViewController(_ viewControllerToPresent: UIViewController) {
        // create a animation object
        let transition = CATransition()
        transition.duration = 0.3 // setting the duration
        transition.type = CATransitionType.push // setting the type of animation
        transition.subtype = CATransitionSubtype.fromRight // setting the direction for the selected animation type
        self.view.window?.layer.add(transition, forKey: kCATransition) // adding the created animation to the passing VC
        
        present(viewControllerToPresent, animated: false, completion: nil) // animation to false because already add a new animation
    }
    
    // create a function to present the secondary VC. Otherwise the FinishGoalVC dismiss back to the CreateGoalVC.
    func presentSecondaryViewController(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        // create the instance of presented ViewController
        guard let presentedViewController = presentedViewController else { return }
        
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    // create a function to dissmiss the passing ViewController just like when having a Navigation Controller
    func dismissViewController() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
