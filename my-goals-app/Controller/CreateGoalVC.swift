//
//  CreateGoalVC.swift
//  my-goals-app
//
//  Created by Sunimal Herath on 16/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
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
        goalTextArea.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextArea.text = "" // since there are no placeholder for UITextView, need to clear the initial text
        goalTextArea.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
        if goalTextArea.text != "" || goalTextArea.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else { return }
            finishGoalVC.initData(withDescription: goalTextArea.text, andGoalType: goalType)
            
            //presentViewController(finishGoalVC)
            presentingViewController?.presentSecondaryViewController(finishGoalVC)
        }
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissViewController()
    }    
}
