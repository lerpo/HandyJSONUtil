//
//  JsonUtil.swift
//  JsonModelUtil
//
//  Created by xml on 2018/4/28.
//  Copyright © 2018年 xml. All rights reserved.
//
import UIKit
import HandyJSON
class JsonUtil: NSObject {
    
    /**
     *  Json转对象
     */
    static func jsonToModel(_ jsonStr:String,_ modelType:HandyJSON.Type) -> HandyJSON {
        if jsonStr == "" || jsonStr.count == 0 {
            #if DEBUG
                print("jsonoModel:字符串为空")
            #endif
            return BaseModel()
        }
        if let model = modelType.deserialize(from: jsonStr) as? BaseModel {
            return model
        } else {
            return modelType.init()
        }
       
        
    }
    
    /**
     *  Json转数组对象
     */
    static func jsonArrayToModel(_ jsonArrayStr:String, _ modelType:HandyJSON.Type) ->[BaseModel] {
        if jsonArrayStr == "" || jsonArrayStr.count == 0 {
            #if DEBUG
                print("jsonToModelArray:字符串为空")
            #endif
            return []
        }
        var modelArray:[BaseModel] = []
        let datas = jsonArrayStr.data(using: String.Encoding.utf8)
        var dataArray:[[String : Any]] = []
        if let array:[[String : Any]] = try? JSONSerialization.jsonObject(with:datas!, options: JSONSerialization.ReadingOptions()) as? [[String : Any]] {
            dataArray = array
        } else {
            return modelArray
        }
        for data:[String : Any] in dataArray {
            if let model = dictionaryToModel(data, modelType) as? BaseModel {
               modelArray.append(model)
            } else {
                modelArray.append(modelType.init() as! BaseModel)
            }
            
        }
        return modelArray
        
    }
    
    /**
     *  字典转对象
     */
    static func dictionaryToModel(_ dictionStr:[String:Any],_ modelType:HandyJSON.Type) -> HandyJSON {
        if dictionStr.count == 0 {
            #if DEBUG
                print("dictionaryToModel:字符串为空")
            #endif
            return BaseModel()
        }
        if let model =  modelType.deserialize(from: dictionStr) as? BaseModel {
            return model
        } else {
            return modelType.init()
        }
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
