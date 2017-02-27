//
//  RNRootViewController.swift
//  RNMoody
//
//  Created by 婉卿容若 on 2017/2/27.
//  Copyright © 2017年 婉卿容若. All rights reserved.
//

import UIKit
import CoreData

class RNRootViewController: UIViewController, ManagedObjectContextSettable {

    @IBOutlet weak var hideCameraConstraint: NSLayoutConstraint!
    
    // properties
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
