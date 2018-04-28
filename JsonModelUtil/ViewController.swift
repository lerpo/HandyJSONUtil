//
//  ViewController.swift
//  JsonModelUtil
//
//  Created by iqusong on 2018/4/28.
//  Copyright © 2018年 iqusong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        jsonTomodel()
        
    }

    fileprivate func jsonTomodel(){
        let jsonString = "{\"id\":12345,\"color\":\"black\",\"name\":\"cat\"}"
        let model:JsonToModel = JsonToModel.jsonToModel(jsonString,JsonToModel()) as! JsonToModel
        print(model)
        print(model.color as Any)
        print(model.id as Any)
    }
   

}

