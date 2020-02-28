//
//  UIViewControllerExtensions.swift
//  Habitual2
//
//  Created by Mondale on 2/28/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

extension UIViewController {
  static func instantiate() -> Self {
    return self.init(nibName: String(describing: self), bundle: nil)
  }
}
