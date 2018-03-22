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
    public var generalComments : String!
    public var studentEmail : String!
    public var school : String!
    public var date : Date!
    public init?(map:Map){}
    
    public init?(interviewername : String, overallrating : Int, generalcomments : String, studentemail : String, school : String, date : Date = Date())
    {
        self.interviewerName = interviewername
        self.overallRating = overallrating
        self.generalComments = generalcomments
        self.studentEmail = studentemail
        self.school = school
        self.date = date
    }
    
    public mutating func mapping(map:Map)
    {
        interviewerName <- map["interviewerName"]
        overallRating <- map["overallRating"]
        generalComments <- map["generalComments"]
        studentEmail <- map["studentEmail"]
        school <- map["school"]
        date <- map["date"]
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
    
    public init?(studentbase64image : String, studentfullname : String, studentemail : String,
                 studentMajor : String, classstanding : String, gpa : Double, graduationdate : Date)
    {
        self.studentBase64Image = studentbase64image
        self.studentFullName = studentfullname
        self.studentEmail = studentemail
        self.studentMajor = studentMajor
        self.studentClassStanding = classstanding
        self.studentGPA = gpa
        self.studentExpectedGraduationDate = graduationdate
    }
    
    
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


