//
//  FinishGoalVC.swift
//  my-goals-app
//
//  Created by Sunimal Herath on 19/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    // Variables
    var goalDescription: String!
    var goalType: GoalType!

    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
    }
    
    // functions
    func initData(withDescription description: String, andGoalType type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    // IBActions
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        // save data in Core Data entity.
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissViewController()
    }    
}
