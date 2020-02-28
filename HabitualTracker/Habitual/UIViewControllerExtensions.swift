//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Mondale on 2/27/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
