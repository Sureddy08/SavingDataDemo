//: Playground - noun: a place where people can play

import UIKit

var animes = ["Naruto","One Piece","Bleach","Fairy Tail"]

let fileManager = NSFileManager.defaultManager()
var documentDir:NSURL?

do{
documentDir = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
}
catch{
    print(error)
}

guard let documentDir = documentDir else{
abort()
}

for anime in animes{
    if let fileUrl = NSBundle.mainBundle().URLForResource(anime, withExtension: "txt"){
    let saveUrl = documentDir.URLByAppendingPathComponent(anime+".txt")
    try? fileManager.moveItemAtURL(fileUrl, toURL: saveUrl)
    }
}

let animeList = try fileManager.contentsOfDirectoryAtURL(documentDir, includingPropertiesForKeys: nil, options: .SkipsHiddenFiles)
for anime in animeList{
print(anime)
}