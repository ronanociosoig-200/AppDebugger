//
//  ScreenLauncherCell.swift
//  Pods-StanwoodDebugger_Example
//
//  Created by Ronan O'Ciosoig on 02/01/2020.
//

import UIKit
import SourceModel

class ScreenLauncherCell: UITableViewCell, Fillable {
    var item: ScreenLauncherItem?
    
    func fill(with model: Model?) {
        guard let item = model as? ScreenLauncherItem else { return }
        self.item = item
        
        textLabel?.text = item.title
    }
}
