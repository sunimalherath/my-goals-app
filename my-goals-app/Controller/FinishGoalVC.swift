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
                    dismissViewController()
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissViewController()
    }
}

extension FinishGoalVC {
    /* Since this VC is presented modally, when dismissing it, won't trigger the viewWillAppear function in GoalsVC.
       Therefore, firing the table reload from this VC as follows.
    */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let goalsVC = presentingViewController as? GoalsVC {
            DispatchQueue.main.async {
                goalsVC.fetchData { (complete) in
                    if complete {
                        if goalsVC.goals.count >= 1 {
                            goalsVC.tableView.isHidden = false
                        } else {
                            goalsVC.tableView.isHidden = true
                        }
                    }
                }
                goalsVC.tableView.reloadData()
            }
        }
    }
}
