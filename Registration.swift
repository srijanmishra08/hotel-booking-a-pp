//
//  Registration.swift
//  hotelbooking
//
//  Created by admin on 11/01/24.
//

import Foundation
struct Registration{
    var firstName: String
    var lastName: String
    var email: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    var wifi: Bool
    var roomType: RoomType
}
