//
//  userModel.swift
//  chatLibrary
//
//  Created by Swaminarayan on 24/03/23.
//

import Foundation
import ChatListView

struct userModel : UserProtocol{
    var id: String
    
    var username: String
    
    var imageURL: URL?
    
    init(id: String, username: String, imageURL: URL? = nil) {
        self.id = id
        self.username = username
        self.imageURL = imageURL
    }
}

extension userModel {
    static let user1 = userModel(
        id: "andrew_parker",
        username: "Andrew Parker",
        imageURL: URL(string: "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
    )
    
    static let user2 = userModel(
        id: "karen.castillo_96",
        username: "Karen Castillo",
        imageURL: URL(string: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80")
    )
    
    static let noImage = userModel(
        id: "lucas.ganimi",
        username: "Lucas Ganimi"
    )
    
    static let starbucks = userModel(
        id: "starbucks",
        username: "Starbucks Coffee",
        imageURL: URL(string: "https://pbs.twimg.com/profile_images/1268570190855331841/CiNnNX94_400x400.jpg")
    )
    
    static let bluebottle = userModel(
        id: "bluebottle",
        username: "Blue Bottle Coffee",
        imageURL: URL(string: "https://pbs.twimg.com/profile_images/1514997622750138368/1mnEPbjo_400x400.jpg")
    )
}
