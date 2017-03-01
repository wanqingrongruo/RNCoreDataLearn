//
//  RNSegueHandlerType.swift
//  RNMoody
//
//  Created by 婉卿容若 on 2017/2/28.
//  Copyright © 2017年 婉卿容若. All rights reserved.
//

import UIKit

public protocol RNSegueHandlerType {
    
    // 采用的是“Associated Types”的方式来实现泛型功能的，通过associatedtype关键字来声明一个类型的占位符作为协议定义的一部分
    associatedtype SegueIdentifier: RawRepresentable
}

extension RNSegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String   {
    
    public func segueIdentifier(ForSegue segue: UIStoryboardSegue) -> SegueIdentifier {
        
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Unknown segue: \(segue))")
        }
        return segueIdentifier
    }
    
    public func performSegue(segueIdentifier: SegueIdentifier) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: nil)
    }
}
