//
//  Utility.swift
//  RecruitmentFramework
//
//  Created by mobiledeveloper on 3/20/18.
//  Copyright © 2018 Oxy. All rights reserved.
//

import Foundation
import Alamofire
import PopupDialog

public class Connectivity {
    public class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
