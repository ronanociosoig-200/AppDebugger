//
//  LauncherItem.swift
//  Pods-StanwoodDebugger_Example
//
//  Created by Ronan O'Ciosoig on 02/01/2020.
//

import UIKit

public struct LauncherItem {
    public let title: String
    public let viewController: UIViewController
    
    public init(title: String, viewController: UIViewController) {
        self.title = title
        self.viewController = viewController
    }
}
