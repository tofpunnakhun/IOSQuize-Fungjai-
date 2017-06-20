//
//  Data.swift
//  IOS Awesome List
//
//  Created by Punnakhun on 6/15/2560 BE.
//  Copyright © 2560 Punnakhun. All rights reserved.
//

import UIKit

class Data {
    
    private var _id: Int!
    private var _name: String!
    private var _type: String!
    private var  _cover: String!
    
    var id: Int {
        if _id == nil {
            _id = 0
        }
        return _id
    }
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var cover: String {
        if _cover == nil {
            _cover = ""
        }
        return _cover
    }
    
    init(dataDictionary: Dictionary <String, AnyObject>) {
        
        if let id = dataDictionary["id"] as? Int {
            self._id = id
        }
        if let name = dataDictionary["name"] as? String {
            self._name = name
        }
        if let type = dataDictionary["type"] as? String {
            self._type = type
        }
        if let cover = dataDictionary["cover"] as? String {
            self._cover = cover
        }
    }
}
