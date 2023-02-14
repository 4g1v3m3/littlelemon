//
//  TextExtension.swift
//  Little Lemon
//
//  Created by Pavel Lebedev on 14.02.2023.
//

import SwiftUI

extension Font {
    static func header(size: CGFloat = 26) -> Font {
        return .custom("Markazi Text", size: size)
    }
    static func body(size: CGFloat = 16) -> Font {
        return .custom("Karla Regular", size: size)
    }
}

extension Color {
    static let primaryColor = Color("Primary")
    static let secondaryColor = Color("Secondary")
    static let highlightColor = Color("Highlight")
}
