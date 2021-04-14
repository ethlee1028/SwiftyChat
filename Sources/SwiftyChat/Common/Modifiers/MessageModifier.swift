//
//  MessageModifier.swift
//  SwiftyChatbot
//
//  Created by Enes Karaosman on 19.05.2020.
//  Copyright © 2020 All rights reserved.
//

import SwiftUI

public struct MessageModifier: ViewModifier {
    
    public var messageKind: ChatMessageKind
    public var isSender: Bool
    
    private var isSpaceFreeMessageKind: Bool {
        if case ChatMessageKind.carousel = self.messageKind {
            return true
        }
        return false
    }
    
    public func body(content: Content) -> some View {
        HStack(spacing: 0) {
            if isSender {
                Spacer(minLength: 0)
            }
            content
            if !isSender && !isSpaceFreeMessageKind {
                Spacer(minLength: 0)
            }
        }.transition(isSender ? .move(edge: .leading) : .slide).embedInAnyView()
    }
}
