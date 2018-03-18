//
//  Obfuscator.swift
//
//  Created by Dejan Atanasov on 2017-05-31.
//

//https://medium.com/theappspace/increase-the-security-of-your-ios-app-by-obfuscating-sensitive-strings-swift-c915896711e6

import Foundation

public struct structFrameworkConstants{
    
    //YOU NEED TO CREATE THE KEY IN EVERY PROJECT BEFORE MOVING IT HERE.  IT USES THE APPDELEGATE
    //PROPERTIES TO CREATE THE KEY.  SO YOU'LL NEED TO GENERATE A KEY IN THE INTERVIEWER PROJECT
    //AND THEN YOU'LL NEED TO CREATE A KEY IN THE STUDENT PROJECT AS WELL
    public static let dbSecondTestKey: [UInt8] = [105, 67, 92, 91, 11, 12, 85, 23, 72, 65, 21, 27, 120, 93, 65, 117, 0, 84, 72, 5, 85, 66, 82, 1, 16, 43, 55, 122, 4, 82, 92, 5, 67, 29, 24, 44]
    
    public static let dbInterviewerClientKey : [UInt8] = [105, 98, 92, 91, 22, 23, 88, 23, 64, 87, 15, 65, 112, 67, 69, 84, 23, 78, 68, 7, 67, 83, 69, 110, 92, 12, 1, 91, 18, 22, 120, 22, 71, 117, 93, 14]
}

public class Obfuscator: Any {
    
    // MARK: - Variables
    
    /// The salt used to obfuscate and reveal the string.
    private var salt: String = ""
    
    
    // MARK: - Initialization
    
    public init(withSalt salt: [AnyObject]) {
        self.salt = salt.description
    }
    
    
    // MARK: - Instance Methods
    
    /**
     This method obfuscates the string passed in using the salt
     that was used when the Obfuscator was initialized.
     
     - parameter string: the string to obfuscate
     
     - returns: the obfuscated string in a byte array
     */
    public func bytesByObfuscatingString(string: String) -> [UInt8] {
        let text = [UInt8](string.utf8)
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count
        
        var encrypted = [UInt8]()
        
        for t in text.enumerated() {
            encrypted.append(t.element ^ cipher[t.offset % length])
        }
        
        #if DEVELOPMENT
            print("Salt used: \(self.salt)\n")
            print("Swift Code:\n************")
            print("// Original \"\(string)\"")
            print("let key: [UInt8] = \(encrypted)\n")
        #endif
        
        return encrypted
    }
    
    /**
     This method reveals the original string from the obfuscated
     byte array passed in. The salt must be the same as the one
     used to encrypt it in the first place.
     
     - parameter key: the byte array to reveal
     
     - returns: the original string
     */
    public func reveal(key: [UInt8]) -> String {
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count
        
        var decrypted = [UInt8]()
        
        for k in key.enumerated() {
            decrypted.append(k.element ^ cipher[k.offset % length])
        }
        
        return String(bytes: decrypted, encoding: .utf8)!
    }
}

