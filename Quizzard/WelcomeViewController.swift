//
//  WelcomeViewController.swift
//  Quizzard
//
//  Created by Tom Wojcik on 04/07/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBAction func getStarted(_ sender: Any) {
        
        performSegue(withIdentifier: "getStarted", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AppDelegate.AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppDelegate.AppUtility.lockOrientation(.all)
    }

}
