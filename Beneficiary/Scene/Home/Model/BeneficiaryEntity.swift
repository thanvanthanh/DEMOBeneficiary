//
//  BeneficiaryEntity.swift
//  Beneficiary
//
//  Created by iOS Team on 5/12/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//

import Foundation
struct BeneficiaryEntity {
    var title: String?
    var button: String?
    
}

struct BeneEntity {
    
    var title:String
    var isExpand:Bool
    var listBene:[BeneModel]
    
    
}

struct BeneModel {
    var transferType : String
    var accountName: String
    var accountType: String
    var beneBank : String
    var image : String
    var ischeck : Bool 

}
