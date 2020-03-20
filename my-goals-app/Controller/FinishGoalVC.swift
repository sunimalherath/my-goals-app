//
//  FinishGoalVC.swift
//  my-goals-app
//
//  Created by Sunimal Herath on 19/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit
import CoreData

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
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return } // 2. using the appDelegate to create the managed context
        let goal = Goal(context: managedContext) // 1. create an instance of the Goal entity - need a managed context to do that
        
        // passing values to the context instance
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        // saving values in the context instance to the persistent storage
        do{
            try managedContext.save()
            completion(true)
            print("Successfully saved")
        } catch {
            debugPrint("Could not save data \(error.localizedDescription)")
            completion(false)
        }
    }
    
    // IBActions
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        // save data in Core Data entity.
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissViewController()
    }
}
