//: Playground - noun: a place where people can play

import UIKit

class EvenFolderShield:NSObject,NSFileManagerDelegate{
    func fileManager(fileManager: NSFileManager, shouldRemoveItemAtURL URL: NSURL) -> Bool {
        var shouldDelete = true
        let urlString = URL.absoluteString
        if urlString.rangeOfString("EvenFolder") != nil{
            shouldDelete = false
        }
        return shouldDelete
    }
}

let fileManager = NSFileManager.defaultManager()

let document = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
    
for index in 0...6{
    let string  = "I am a String \(index)"
    let url = document.URLByAppendingPathComponent("String_\(index).txt")
    do{
        //try string.writeToURL(url, atomically: true, encoding: NSUTF8StringEncoding)
    }
    catch{
    print(error)
    }
}

do{
let documentLists = try fileManager.contentsOfDirectoryAtURL(document, includingPropertiesForKeys: nil, options: .SkipsHiddenFiles)
    for url in documentLists{
    print(url)
    }
    let evenFolder = document.URLByAppendingPathComponent("EvenFolder", isDirectory: true)
    let oddFolder = document.URLByAppendingPathComponent("oddFolder" ,isDirectory: true)
    
    try? fileManager.createDirectoryAtURL(evenFolder, withIntermediateDirectories: false, attributes: nil)
    try? fileManager.createDirectoryAtURL(oddFolder, withIntermediateDirectories: false, attributes: nil)
    let evenFolderShield = EvenFolderShield()
    fileManager.delegate = evenFolderShield
    for index in 0...6{
        var destinationURL:NSURL
        let fileName = "String_\(index).txt"
        let targetItem = document.URLByAppendingPathComponent(fileName)
        
        if(index % 2 == 0){
         destinationURL = evenFolder
        }
        else{
            destinationURL = oddFolder
        }
        destinationURL = destinationURL.URLByAppendingPathComponent(fileName,isDirectory:false)
      // try fileManager.moveItemAtURL(targetItem, toURL: destinationURL)
        try fileManager.removeItemAtURL(destinationURL)
    }
}
catch{
    print(error)
}
