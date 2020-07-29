import AVKit
import UIKit

enum Style {
    case characterBackground(UIColor)
    case background(UIColor)
    case foreground(UIColor)
    case fontSize(Int)
    case bold
    case italic
    case underline
    case edge(Edge)

    private var key: String {
        switch self {
            case .background: return String(kCMTextMarkupAttribute_BackgroundColorARGB)
            case .characterBackground: return String(kCMTextMarkupAttribute_CharacterBackgroundColorARGB)
            case .foreground: return String(kCMTextMarkupAttribute_ForegroundColorARGB)
            case .fontSize: return String(kCMTextMarkupAttribute_BaseFontSizePercentageRelativeToVideoHeight)
            case .bold: return String(kCMTextMarkupAttribute_BoldStyle)
            case .underline: return String(kCMTextMarkupAttribute_UnderlineStyle)
            case .italic: return String(kCMTextMarkupAttribute_ItalicStyle)
            case .edge: return String(kCMTextMarkupAttribute_CharacterEdgeStyle)
        }
    }

    var rule: AVTextStyleRule {
        switch self {
            case .bold, .italic, .underline:
                return AVTextStyleRule(textMarkupAttributes: [ self.key: true])!
            case .fontSize(let size):
                return AVTextStyleRule(textMarkupAttributes: [ self.key: size])!
            case .background(let color), .characterBackground(let color), .foreground(let color):
                return AVTextStyleRule(textMarkupAttributes: [ self.key: color.argb])!
            case .edge(let style):
                return AVTextStyleRule(textMarkupAttributes: [ self.key: style.style])!
        }
    }
}
