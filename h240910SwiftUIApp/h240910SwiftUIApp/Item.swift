//
//  Item.swift
//  h240910SwiftUIApp
//
//  Created by hwacdx on 2024/9/10.
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
