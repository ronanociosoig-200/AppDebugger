//
//  LauncherItem.swift
//  Pods-StanwoodDebugger_Example
//
//  Created by Ronan O'Ciosoig on 02/01/2020.
//

import UIKit

public struct LauncherItem {
    public let title: String
    public let viewControllerName: String
    
    public init(title: String, viewControllerName: String) {
        self.title = title
        self.viewControllerName = viewControllerName
    }
}
