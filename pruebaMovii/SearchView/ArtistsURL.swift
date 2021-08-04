//
//  ArtistsURL.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 2/08/21.
//

import Foundation

struct ArtistURL : Codable {
    var artists : Artist
    struct Artist : Codable {
        var items : [items]
        
        
     
    }
    
    struct items: Codable {
        var name: String
        var images : [images]
        var popularity : Int
        var id : String
    }
    struct images : Codable{
        var url : String
    }
}

