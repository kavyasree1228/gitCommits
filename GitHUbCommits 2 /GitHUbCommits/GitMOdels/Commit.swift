/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Commit {
	public var author : Author?
	public var committer : CommitCommiter?
	public var message : String?
	public var tree : Tree?
	public var url : String?
	public var comment_count : Int?
	public var verification : Verification?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let commit_list = Commit.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Commit Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Commit]
    {
        var models:[Commit] = []
        for item in array
        {
            models.append(Commit(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let commit = Commit(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Commit Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["author"] != nil) { author = Author(dictionary: dictionary["author"] as! NSDictionary) }
		if (dictionary["committer"] != nil) { committer = CommitCommiter(dictionary: dictionary["committer"] as! NSDictionary) }
		message = dictionary["message"] as? String
		if (dictionary["tree"] != nil) { tree = Tree(dictionary: dictionary["tree"] as! NSDictionary) }
		url = dictionary["url"] as? String
		comment_count = dictionary["comment_count"] as? Int
		if (dictionary["verification"] != nil) { verification = Verification(dictionary: dictionary["verification"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.author?.dictionaryRepresentation(), forKey: "author")
		dictionary.setValue(self.committer?.dictionaryRepresentation(), forKey: "committer")
		dictionary.setValue(self.message, forKey: "message")
		dictionary.setValue(self.tree?.dictionaryRepresentation(), forKey: "tree")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.comment_count, forKey: "comment_count")
		dictionary.setValue(self.verification?.dictionaryRepresentation(), forKey: "verification")

		return dictionary
	}

}
