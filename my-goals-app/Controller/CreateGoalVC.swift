//
//  CreateGoalVC.swift
//  my-goals-app
//
//  Created by Sunimal Herath on 16/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    // IBOutlets
    @IBOutlet weak var goalTextArea: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    // Variables
    var goalType: GoalType = .ShortTerm

    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    // IBActions
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .ShortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .LongTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissViewController()
    }    
}
