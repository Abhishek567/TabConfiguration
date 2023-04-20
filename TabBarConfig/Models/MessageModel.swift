//
//  MessageModel.swift
//  chatLibrary
//
//  Created by Swaminarayan on 24/03/23.
//

import Foundation
import ChatListView

struct messageModel : MessageProtocol, Identifiable{
    static func == (lhs: messageModel, rhs: messageModel) -> Bool {
        lhs.id == rhs.id
    }
    
    
    var id: String
    var sentAt: Double
    var style: MessageStyle
    var sender: userModel
    
    static let msg1 = messageModel(
        id: UUID().uuidString,
        sentAt: 1675331868,
        style: .text("Hi, there! I would like to ask about my order [#1920543](https://instagram.com/j_sung_0o0). Your agent mentioned that it would be available on [September 18](mailto:). However, I haven’t been notified yet by your company about my product availability. Could you provide me some news regarding it?"),
        sender: userModel.bluebottle)
    
    static let message2 = messageModel(
        id: UUID().uuidString,
        sentAt: 1675342668,
        style: .text("Hi **Alexander**, we’re sorry to hear that. Could you give us some time to check on your order first? We will update you as soon as possible. Thanks!"),
        sender: userModel.user1)
    
    static let message3 = messageModel(
        id: UUID().uuidString,
        sentAt: 1675342668,
        style: .text("Hi **Daniel**,\nThanks for your booking. We’re pleased to have you on board with us soon. Please find your travel details attached."),
        sender: userModel.starbucks
    )
    
    static let message4 = messageModel(
        id: UUID().uuidString,
        sentAt: 1675322668,
        style: .text("Hi, we’re sorry to hear that. testing message flow for development..."),
        sender: userModel.user1)
    
    static let message5 = messageModel(
        id: UUID().uuidString,
        sentAt: 1675347668,
        style: .text("Please find your travel details attached, testing msg ...."),
        sender: userModel.starbucks
    )
}
