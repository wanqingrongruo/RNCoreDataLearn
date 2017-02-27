//
//  ExtensionUtilities.swift
//  RNMoody
//
//  Created by 婉卿容若 on 2017/2/27.
//  Copyright © 2017年 婉卿容若. All rights reserved.
//

import Foundation


extension URL{
    
    static var documentsURL: URL{
        
        set{
            
        }
        get{
          return try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        }
    }
}
