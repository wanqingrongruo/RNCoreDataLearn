//
//  Mood.swift
//  RNMoody
//
//  Created by 婉卿容若 on 2017/2/27.
//  Copyright © 2017年 婉卿容若. All rights reserved.
//

import UIKit
import CoreData

public final class Mood: ManagedObject {

    // “private(set) 这个访问控制修饰符表示这两个属性都是公开只读的”
    
    @NSManaged public private(set) var date: NSDate
    @NSManaged public private(set) var colors: [UIColor]
}
