//
//  Models.swift
//  RecruitmentToolFramework
//
//  Created by Nathan on 3/16/18.
//  Copyright © 2018 Oxy. All rights reserved.
//

import Foundation
import ObjectMapper

open class ISODateTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String
    
    public init() {}
    
    public func transformFromJSON (_ value: Any?) -> Date? {
        
        guard let datestring = value as? String else { return nil }
        
        //Not sure what's goin on with the json.  Sometimes in the
        //date/time field, there is a '.' and sometimes not.
        //Look for both before returning the transformed date
        
        let dateFormat1 = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let dateFormat2 = "yyyy-MM-dd'T'HH:mm:ss"
        //datestring    String    "2016-06-28T17:23:35.203"
        
        if let k = Date(fromString: datestring, format: .custom(dateFormat1))
        {
            return k
        }
        
        if let k = Date(fromString: datestring, format: .custom(dateFormat2))
        {
            return k
        }
        
        return nil
        
        //let isoFormatter = ISO8601DateFormatter()
        //let date = isoFormatter.date(from: datestring)!
        //return date
    }
    
    public func transformToJSON(_ value: Date?) -> String? {
        let isoFormatter = ISO8601DateFormatter()
        let string = isoFormatter.string(from: value!)
        
        return string
    }
}
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
        date <- (map["date"], ISODateTransform())
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
        studentExpectedGraduationDate <- (map["studentExpectedGraduationDate"], ISODateTransform())
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


