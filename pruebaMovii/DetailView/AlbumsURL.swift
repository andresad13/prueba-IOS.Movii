//
//  AlbumsURL.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 4/08/21.
//

import Foundation

struct AlbumsURL : Codable {
    var items : [Items]
    struct Items : Codable {
        var name : String
        var images : [images]
    }
    struct images : Codable{
        var url : String
    }
    
}
