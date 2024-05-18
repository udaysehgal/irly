//
//  Utils.swift
//  irly
//
//  Created by Uday on 18/05/24.
//

import SwiftUI

extension Color {
        static func darkGrayColor() -> Color {
            return Color(red: 0.22, green: 0.22, blue: 0.22)
        }
    
        static func darkerGrayColor() -> Color{
            return Color(red:0.5, green: 0.5, blue: 0.5)
        }

        static func lightGrayColor() -> Color {
            return Color(red: 0.9, green: 0.9, blue: 0.9)
        }
    
        static func lighterGrayColor() -> Color {
            return Color(red: 0.92, green: 0.92, blue: 0.92)
        }

        static func lightPurpleColor() -> Color {
            return Color(red: 0.7, green: 0.5, blue: 0.9)
        }
        
        static func darkPurpleColor() -> Color {
            return Color(
                red: Double(0x77) / 255.0,
                green: Double(0x34) / 255.0,
                blue: Double(0xeb) / 255.0
            )
        }
}
