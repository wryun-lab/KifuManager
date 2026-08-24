//
//  Item.swift
//  KifuManager
//
//  Created by Takashi Takeuchi on 2025/05/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
