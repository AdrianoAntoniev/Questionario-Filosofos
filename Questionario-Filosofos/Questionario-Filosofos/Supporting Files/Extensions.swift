//
//  Extensions.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 18/07/21.
//

import UIKit

// MARK: - Extension for UIViewController

extension UIViewController {
    
    // MARK: - Hides back button in nav controller
    
    func hideBackButton() {
        self.navigationItem.hidesBackButton = true
    }
}
