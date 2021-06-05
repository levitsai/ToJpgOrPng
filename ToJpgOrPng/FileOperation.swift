//
//  FileOperation.swift
//  ToJpgOrPng
//
//  Created by Tsai I Lun on 2021/6/6.
//

import Foundation

struct FileOperation {
    
    
    func save( fileName: String, bytes: Data){
        
        print(FileManager.SearchPathDirectory.documentDirectory)
        print(FileManager.SearchPathDirectory.documentationDirectory)
        
        
        print(FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask))
        print(FileManager.default.urls(for: FileManager.SearchPathDirectory.documentationDirectory, in: FileManager.SearchPathDomainMask.userDomainMask))
        
        var docFolder = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)[0]
        docFolder.appendPathComponent(fileName + ".jpeg")
        print(docFolder)
        
        try? bytes.write(to: docFolder, options: .atomicWrite)
        
        
        
        
    }
    
    
    
}
