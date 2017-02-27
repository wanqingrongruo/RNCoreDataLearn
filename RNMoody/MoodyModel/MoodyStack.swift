//
//  MoodyStack.swift
//  RNMoody
//
//  Created by 婉卿容若 on 2017/2/27.
//  Copyright © 2017年 婉卿容若. All rights reserved.
//

// Core Data 栈

import CoreData

// private var baseURL =  URL.documentsURL
private let StoreURL = URL.documentsURL.appendingPathComponent("RNMoony.moody")

public func createMoodyMainContext() -> NSManagedObjectContext? {
    
    let bundles = [Bundle(for: Mood.self)] // 获取对象模型所在的 bundle
    guard let model = NSManagedObjectModel.mergedModel(from: bundles) else{ // 加载数据模型, 将他们合并成一个托管对象模型
        fatalError("model not found")
    }
    
    let psc = NSPersistentStoreCoordinator(managedObjectModel: model) // 创建持久化存储协调器
    // 类型为: NSSQLiteStoreType
    // 存储的位置: “由私有的 StoreURL 常量指定的，它指向 documents 目录里的 Moody.moody 文件。”
    // “如果数据库已经存在于这个路径，那么它会被打开；否则的话，Core Data 会在这个位置创建一个新的数据库。
    try! psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: StoreURL, options: nil)
    // 创建托管上下文 - mainQueueConcurrencyType 表示上下文是绑定到主线程,也就是我们处理 UI 交互的地方,我们可以有从 UI 代码的任何地方安全的访问这个上下文和其中的托管对象
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    // 将协调器赋值给上下文
    context.persistentStoreCoordinator = psc
    return context
}
