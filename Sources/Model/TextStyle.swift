import AVKit
import UIKit

enum TextStyle {
    case alignment(Alignment)
    case background(UIColor)
    case bold
    case characterBackground(UIColor)
    case direction(Direction)
    case edge(EdgeStyle)
    case font(Font)
    case fontSize(Int)
    case foreground(UIColor)
    case italic
    case underline

    var key: String {
        switch self {
            case .alignment: return "CMWritingDirectionAlignment"
            case .bold: return "CMBoldStyle"
            case .background: return "CMBackgroundColorARGB"
            case .characterBackground: return "CMCharacterBackgroundColorARGB"
            case .direction: return "CMVerticalLayout"
            case .foreground: return "CMForegroundColorARGB"
            case .fontSize: return "CMBaseFontSizePercentage"
            case .underline: return "CMUnderlineStyle"
            case .italic: return "CMItalicStyle"
            case .edge: return "CMCharacterEdgeStyle"
            default: return ""
        }
    }

    var value: AVTextStyleRule {
        switch self {
            case .bold, .italic, .underline:
                return AVTextStyleRule(textMarkupAttributes: [ self.key: true])!
            case .fontSize(let size):
                return AVTextStyleRule(textMarkupAttributes: [ self.key: size])!
            case .background(let color), .characterBackground(let color), .foreground(let color):
                return AVTextStyleRule(textMarkupAttributes: [ self.key: color.argb])!
            case .edge(let edge):
                return AVTextStyleRule(textMarkupAttributes: [ self.key: edge.rawValue])!
            case .font(let font):
                return AVTextStyleRule(textMarkupAttributes: [ font.key: font.value])!
            case .alignment(let alignment):
                return AVTextStyleRule(textMarkupAttributes: [ self.key: alignment.rawValue])!
            case .direction(let direction):
                return AVTextStyleRule(textMarkupAttributes: [ self.key: direction.rawValue])!
        }
    }
}
