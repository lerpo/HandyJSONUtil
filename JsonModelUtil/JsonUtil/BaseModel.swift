//
//  BaseModel.swift
//  JsonModelUtil
//
//  Created by iqusong on 2018/4/28.
//  Copyright © 2018年 iqusong. All rights reserved.
//

import UIKit
import HandyJSON
class BaseModel: HandyJSON {
//    var date: Date?
//    var decimal: NSDecimalNumber?
//    var url: URL?
//    var data: Data?
//    var color: UIColor?
    
    required init() {}
    
    func mapping(mapper: HelpingMapper) {   //自定义解析规则，日期数字颜色，如果要指定解析格式，子类实现重写此方法即可
//        mapper <<<
//            date <-- CustomDateFormatTransform(formatString: "yyyy-MM-dd")
//
//        mapper <<<
//            decimal <-- NSDecimalNumberTransform()
//
//        mapper <<<
//            url <-- URLTransform(shouldEncodeURLString: false)
//
//        mapper <<<
//            data <-- DataTransform()
//
//        mapper <<<
//            color <-- HexColorTransform()
      }
    
    
    static func jsonToModel(_ jsonStr:String, _ model:BaseModel) ->BaseModel {
        if jsonStr == "" || jsonStr.count == 0 {
            #if DEBUG
                print("jsonoModel:字符串为空")
            #endif
            return BaseModel()
        }
        return type(of: model).deserialize(from: jsonStr)!
        //return JSONDeserializer<VcType>.deserializeFrom(json: jsonStr)! as! BaseModel
    }
    
    /**
     *  Json转数组对象
     */
    static func jsonToModelArray(_ jsonStr:String) ->[BaseModel] {
        if jsonStr == "" || jsonStr.count == 0 {
            #if DEBUG
                print("jsonToModelArray:字符串为空")
            #endif
            return []
        }
        return [BaseModel].deserialize(from: jsonStr)! as! [BaseModel]
    }
    
    /**
     *  字典转对象
     */
    static func dictionaryToModel(_ dictionStr:[String:Any]) -> BaseModel {
        if dictionStr.count == 0 {
            #if DEBUG
                print("dictionaryToModel:字符串为空")
            #endif
            return BaseModel()
        }
        return BaseModel.deserialize(from: dictionStr)!
    }
    
    /**
     *  对象转JSON
     */
    static func modelToJson(_ model:BaseModel?) -> String {
        if model == nil {
            #if DEBUG
                print("modelToJson:model为空")
            #endif
            return ""
        }
        return (model?.toJSONString())!
    }
    
    /**
     *  对象转字典
     */
    static func modelToDictionary(_ model:BaseModel?) -> [String:Any] {
        if model == nil {
            #if DEBUG
                print("modelToJson:model为空")
            #endif
            return [:]
        }
        return (model?.toJSON())!
    }
    
}
