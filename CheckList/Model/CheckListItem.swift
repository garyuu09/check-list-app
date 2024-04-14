//
//  CheckListItem.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/13.
//

import Foundation
import SwiftData

// 項目を表すデータモデル
@Model
final class ChecklistItem: Identifiable, Equatable {
    var title: String
    var isChecked: Bool

    init(title: String, isChecked: Bool) {
        self.title = title
        self.isChecked = isChecked
    }
}
