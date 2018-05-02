//
//  CombineModel.swift
//  JsonModelUtil
//
//  Created by iqusong on 2018/5/2.
//  Copyright © 2018年 iqusong. All rights reserved.
//

import UIKit
class Composition:  BaseModel {
    var aInt:Int?
    var aString:String?
}

class CombineModel: BaseModel {
    var aInt:Int?
    var comp1:Composition?
    var comp2:[Composition] = []
    
}
