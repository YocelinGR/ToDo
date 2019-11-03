//
//  NFLStaticTableViewController.swift
//  RepasoTableViews
//
//  Created by Apple Device 11 on 11/2/19.
//  Copyright © 2019 Apple Device 11. All rights reserved.
//

import UIKit

class NFLStaticTableViewController: UITableViewController {
    
    @IBOutlet weak var nflLabel: UILabel!
    
    var nflTeam = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nflLabel.text = nflTeam
    }
}
