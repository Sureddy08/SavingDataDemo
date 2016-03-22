//: Playground - noun: a place where people can play

import UIKit

let str = "Hello, playground"
let fileManager = NSFileManager.defaultManager()
//NSString
do{
    var documents = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
    var url = NSURL(string: "string.text", relativeToURL: documents)
    //saving data to disk
    try str.writeToURL(url!, atomically: true, encoding: NSUTF8StringEncoding)
    //reading data from disk
    if let url = url{
    let text = try String(contentsOfURL: url)
    print(text)
    }
}
catch{
print(error)
}
//NSData
if let image = UIImage(named: "luffy.jpg"){
    image
 let imageData = UIImagePNGRepresentation(image)
 do{
    var document = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
    var url = NSURL(string: "luffy.bin", relativeToURL: document)
    //writing
    imageData?.writeToURL(url!, atomically: true)
    //reading
    if let imageData = NSData(contentsOfURL: url!){
        let image = UIImage(data: imageData)
    }
 }
 catch{
    print(error)
     }
}

