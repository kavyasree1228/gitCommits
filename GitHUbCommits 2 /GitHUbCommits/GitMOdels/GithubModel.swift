/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class GithubModel {
	public var sha : String?
	public var node_id : String?
	public var commit : Commit?
	public var url : String?
	public var html_url : String?
	public var comments_url : String?
	public var author : Author?
	public var committer : Committer?
	public var parents : Array<Parents>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [GithubModel]
    {
        var models:[GithubModel] = []
        for item in array
        {
            models.append(GithubModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		sha = dictionary["sha"] as? String
		node_id = dictionary["node_id"] as? String
		if (dictionary["commit"] != nil) { commit = Commit(dictionary: dictionary["commit"] as! NSDictionary) }
		url = dictionary["url"] as? String
		html_url = dictionary["html_url"] as? String
		comments_url = dictionary["comments_url"] as? String
		if (dictionary["author"] != nil) { author = Author(dictionary: dictionary["author"] as! NSDictionary) }
		if (dictionary["committer"] != nil) { committer = Committer(dictionary: dictionary["committer"] as! NSDictionary) }
        if (dictionary["parents"] != nil) { parents = Parents.modelsFromDictionaryArray(array: dictionary["parents"] as! NSArray) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.sha, forKey: "sha")
		dictionary.setValue(self.node_id, forKey: "node_id")
		dictionary.setValue(self.commit?.dictionaryRepresentation(), forKey: "commit")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.html_url, forKey: "html_url")
		dictionary.setValue(self.comments_url, forKey: "comments_url")
		dictionary.setValue(self.author?.dictionaryRepresentation(), forKey: "author")
		dictionary.setValue(self.committer?.dictionaryRepresentation(), forKey: "committer")

		return dictionary
	}

}
