//
//  GoalCell.swift
//  my-goals-app
//
//  Created by Sunimal Herath on 12/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(withDescription description: String, goalType type: String, andGoalProgressAmount progress: Int) {
        self.goalDescriptionLbl.text = description
        self.goalTypeLbl.text = type
        self.goalProgressLbl.text = String(describing: progress)
    }

}
