//
//  RoomType.swift
//  hotelbooking
//
//  Created by admin on 11/01/24.
//

import Foundation
struct RoomType:Equatable{
    var id: Int
    var name: String
    var ShortName:String
    var price:Int
    static func == (lhs:RoomType,rhs:RoomType)->Bool{
        return lhs.id == rhs.id
    }
    static var all: [RoomType]{
        return[RoomType(id: 0, name: "Two Queens", ShortName: "2Q", price: 179),
               RoomType(id: 1, name: "One King", ShortName: "penthouse", price: 189),
               RoomType(id: 2, name: "PentHouse Suite", ShortName: "PHS", price: 309)]
    }
}
