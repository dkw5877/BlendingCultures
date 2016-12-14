//
//  DataType.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import Foundation

protocol DataType {
    var numberOfItems:Int{ get }
    func addNewItemAtIndex(index:Int) -> Self
    func deleteItemAtIndex(index:Int) -> Self
    func moveItem(fromIndex:Int, toIndex:Int) -> Self
}
