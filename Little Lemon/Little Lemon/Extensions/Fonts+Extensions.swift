//
//  Fonts+Extensions.swift
//  Little Lemon
//
//  Created by Pavel Lebedev on 14.02.2023.
//

import SwiftUI
import Foundation




extension Font {
    enum CustomFont: String {
        case bodyBold = "Karla-Bold"
        case bodyExtra = "Karla-ExtraBold"
        case bodyMedium = "Karla-Medium"
        case bodyRegular = "Karla-Regular"
        case headMedium = "MarkaziText-Medium"
        case headRegular = "MarkaziText-Regular"
    }
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
