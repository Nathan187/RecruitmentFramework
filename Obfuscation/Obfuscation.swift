//
//  Obfuscator.swift
//
//  Created by Dejan Atanasov on 2017-05-31.
//

//https://medium.com/theappspace/increase-the-security-of-your-ios-app-by-obfuscating-sensitive-strings-swift-c915896711e6

import Foundation

public struct structFrameworkConstants{
    
    public static let dbSecondTestKey: [UInt8] = [105, 67, 92, 91, 11, 12, 85, 23, 72, 65, 21, 27, 120, 93, 65, 117, 0, 84, 72, 5, 85, 66, 82, 1, 16, 43, 55, 122, 4, 82, 92, 5, 67, 29, 24, 44]
    
    public static let dbInterviewerKey : [UInt8] = [105, 96, 118, 123, 59, 48, 101, 77, 108, 66, 17, 113, 92, 65, 84, 86, 4, 76, 72, 78, 20, 120, 100, 98, 82, 15, 1, 86, 18, 20, 25, 40, 100, 98, 76, 16]
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

