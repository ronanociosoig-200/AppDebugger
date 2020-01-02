//
//  ScreenLauncherItems.swift
//  Pods-StanwoodDebugger_Example
//
//  Created by Ronan O'Ciosoig on 02/01/2020.
//

import Foundation
import SourceModel

class ScreenLauncherItems: Elements<ScreenLauncherItem> {
    static let fileName: String = "launch_items"
    
    func removeAll() {
        items.removeAll()
    }
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return ScreenLauncherCell.self
    }
}
