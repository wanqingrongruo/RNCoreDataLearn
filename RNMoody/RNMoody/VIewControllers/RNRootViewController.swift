//
//  RNRootViewController.swift
//  RNMoody
//
//  Created by 婉卿容若 on 2017/2/27.
//  Copyright © 2017年 婉卿容若. All rights reserved.
//

import UIKit
import CoreData

class RNRootViewController: UIViewController, ManagedObjectContextSettable, RNSegueHandlerType {
    
    enum SegueIdentifier: String {
        case EmbedRegionsNav = "embedRegionsNav"
        case EmbedCamera = "embedCamera"
    }

    @IBOutlet weak var hideCameraConstraint: NSLayoutConstraint!
    
    // public properties
    var managedObjectContext: NSManagedObjectContext!
    
    // private properties
    private var cameraViewController: RNCameraViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(ForSegue: segue) {
        case .EmbedRegionsNav:
            guard let nc = segue.destination as? UINavigationController, let vc = nc.viewControllers.first as? ManagedObjectContextSettable else {
                
                fatalError("wrong view controller type")
            }
            vc.managedObjectContext = managedObjectContext
           // nc.delegate = self
        case .EmbedCamera:
            guard let cameraVC = segue.destination as? RNCameraViewController else {
                fatalError("wrong view controller type")
            }
            cameraViewController = cameraVC
       
        }
    }
}

// MARK: - Private methods

extension RNRootViewController {
    
    private func setCameraVisibility(visible: Bool) {
        hideCameraConstraint.isActive = !visible
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .beginFromCurrentState, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}

// MARK: - UINavigationControllerDelegate

extension RNRootViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        //
    }
}
