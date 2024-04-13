//
//  CustomButtonStyle.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/13.
//

import SwiftUI

/// 背景塗りつぶしで角丸なボタンスタイル
struct RoundedButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled

    var color: Color = .blue
    private let disabledColor: Color = .init(uiColor: .lightGray)
    private let backgroundColor: Color = .white
    private let cornerRadius: CGFloat = 8.0
    private let lineWidth: CGFloat = 2.0

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 240)
            .fontWeight(.bold)
            .foregroundColor(.white)
            // 有効無効でカラーを変更
            .background(isEnabled ? color : disabledColor)
            // 押下時かどうかで透明度を変更
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}
