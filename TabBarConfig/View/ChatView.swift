//
//  ChatView.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 12/04/23.
//

import SwiftUI
import ChatListView

struct ChatView: View {
    var body: some View {
        ChatListView(Rooms: [channelModel.channel1, channelModel.new], msgs: [messageModel.msg1, messageModel.message3, messageModel.message5])
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
