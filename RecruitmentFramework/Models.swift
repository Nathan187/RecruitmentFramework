//
//  Models.swift
//  RecruitmentToolFramework
//
//  Created by Nathan on 3/16/18.
//  Copyright © 2018 Oxy. All rights reserved.
//

import Foundation
import ObjectMapper


public struct structInterviewerModel : Mappable
{
    public var interviewerName : String!
    public var overallRating : Int!
    public var generalComments : Int!
    public var studentEmail : String!
    
    public init?(map:Map){}
    
    public mutating func mapping(map:Map)
    {
        interviewerName <- map["interviewerName"]
        overallRating <- map["overallRating"]
        generalComments <- map["generalComments"]
        generalComments <- map["studentEmail"]
    }
}

public struct structStudentModel : Mappable
{
    public var studentBase64Image : String!
    public var studentFullName : String!
    public var studentEmail : String!
    public var studentMajor : String!
    public var studentClassStanding : String!
    public var studentGPA : Double!
    public var studentExpectedGraduationDate : Date!
    
    public init?(map:Map){}
    
    public mutating func mapping(map:Map)
    {
        studentBase64Image <- map["studentBase64Image"]
        studentFullName <- map["studentFullName"]
        studentEmail <- map["studentEmail"]
        studentMajor <- map["studentMajor"]
        studentClassStanding <- map["studentClassStanding"]
        studentGPA <- map["studentGPA"]
        studentExpectedGraduationDate <- map["studentExpectedGraduationDate"]
    }
}

public struct structAccountModel : Mappable
{
    public var displayname : String!
    public var username : String!
    public var accesstoken : String!
    
    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
        displayname <- map["displayname"]
        username <- map["username"]
        accesstoken <- map["accesstoken"]
    }
}


