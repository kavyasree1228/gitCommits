/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Verification {
	public var verified : Bool?
	public var reason : String?
	public var signature : String?
	public var payload : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let verification_list = Verification.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Verification Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Verification]
    {
        var models:[Verification] = []
        for item in array
        {
            models.append(Verification(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let verification = Verification(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Verification Instance.
*/
	required public init?(dictionary: NSDictionary) {

		verified = dictionary["verified"] as? Bool
		reason = dictionary["reason"] as? String
		signature = dictionary["signature"] as? String
		payload = dictionary["payload"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.verified, forKey: "verified")
		dictionary.setValue(self.reason, forKey: "reason")
		dictionary.setValue(self.signature, forKey: "signature")
		dictionary.setValue(self.payload, forKey: "payload")

		return dictionary
	}

}