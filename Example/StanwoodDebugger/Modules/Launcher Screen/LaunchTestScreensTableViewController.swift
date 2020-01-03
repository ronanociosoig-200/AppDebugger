//
//  LaunchTestScreensTableViewController.swift
//  StanwoodDebugger_Example
//
//  Created by Ronan O'Ciosoig on 03/01/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class LaunchTestScreensTableViewController: UITableViewController {
    func configure() {
        title = "Launcher"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Sample screen"
        return cell
    }
}
