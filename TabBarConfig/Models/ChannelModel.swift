//
//  ChannelModel.swift
//  chatLibrary
//
//  Created by Swaminarayan on 24/03/23.
//

import Foundation
import ChatListView

struct channelModel: ChannelProtocol{
    
    typealias UserType = userModel
    
    typealias MessageType = messageModel
    
    var id: String
    var name: String
    var imageURL: URL?
    var members: [userModel]
    var lastMessage: messageModel?
    
    init(id: String, name: String, imageURL: URL? = nil, members: [userModel], lastMessage: messageModel? = nil) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.members = members
        self.lastMessage = lastMessage
    }
    
    static let channel1 = channelModel(
        id: userModel.bluebottle.id,
        name: userModel.bluebottle.username,
        imageURL: userModel.bluebottle.imageURL,
        members: [userModel.user1, userModel.bluebottle],
        lastMessage: nil
    )
    
    static let new = channelModel(
        id: UUID().uuidString,
        name: userModel.user2.username,
        imageURL: nil,
        members: [userModel.user1, userModel.user2],
        lastMessage: messageModel.msg1
    )
}
