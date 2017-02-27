//
//  ManagedObjectContextSettable.swift
//  RNMoody
//
//  Created by 婉卿容若 on 2017/2/27.
//  Copyright © 2017年 婉卿容若. All rights reserved.
//

import CoreData

protocol ManagedObjectContextSettable: class {
    var managedObjectContext: NSManagedObjectContext! { set get }
}
