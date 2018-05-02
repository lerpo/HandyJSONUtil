//
//  SpacialTypeModel.swift
//  JsonModelUtil
//
//  Created by iqusong on 2018/5/2.
//  Copyright © 2018年 iqusong. All rights reserved.
//

import UIKit
import HandyJSON
class SpacialTypeModel: BaseModel {
    var date: Date?
    var decimal: NSDecimalNumber?
    var url: URL?
    var data: Data?
    var color: UIColor?
    
    override func mapping(mapper: HelpingMapper) {
        mapper <<<
            date <-- CustomDateFormatTransform(formatString: "yyyy-MM-dd")

        mapper <<<
            decimal <-- NSDecimalNumberTransform()

        mapper <<<
            url <-- URLTransform(shouldEncodeURLString: false)

        mapper <<<
            data <-- DataTransform()

        mapper <<<
            color <-- HexColorTransform()
    }

}
