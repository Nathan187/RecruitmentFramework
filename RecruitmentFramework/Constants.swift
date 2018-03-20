//
//  Constants.swift
//  RecruitmentFramework
//
//  Created by Nathan on 3/20/18.
//  Copyright © 2018 Oxy. All rights reserved.
//

import Foundation


public struct structFrameworkConstants{
    
    //YOU NEED TO CREATE THE KEY IN EVERY PROJECT BEFORE MOVING IT HERE.  IT USES THE APPDELEGATE
    //PROPERTIES TO CREATE THE KEY.  SO YOU'LL NEED TO GENERATE A KEY IN THE INTERVIEWER PROJECT
    //AND THEN YOU'LL NEED TO CREATE A KEY IN THE STUDENT PROJECT AS WELL
    public static let ConstdbSecondTestKey: [UInt8] = [105, 67, 92, 91, 11, 12, 85, 23, 72, 65, 21, 27, 120, 93, 65, 117, 0, 84, 72, 5, 85, 66, 82, 1, 16, 43, 55, 122, 4, 82, 92, 5, 67, 29, 24, 44]
    
    public static let ConstdbInterviewerClientKey : [UInt8] = [105, 98, 92, 91, 22, 23, 88, 23, 64, 87, 15, 65, 112, 67, 69, 84, 23, 78, 68, 7, 67, 83, 69, 110, 92, 12, 1, 91, 18, 22, 120, 22, 71, 117, 93, 14]
    
    public static let RTConstkeychainUserNameService = "RecruitmentUserNameService"
    public static let RTConstkeychainUserNameAccount = "RecruitmentUserNameAccount"
    public static let RTConstkeychainUserNameLabel = "RecruitmentUserNameLabel"
    
    public static let RTConstkeychainPasswordService = "RecruitmentPasswordService"
    public static let RTConstkeychainPasswordAccount = "RecruitmentPasswordAccount"
    public static let RTConstkeychainPasswordLabel = "RecruitmentPasswordLabel"
}
