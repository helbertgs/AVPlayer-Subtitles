import CoreMedia

enum Font: Equatable {
    case `default`
    case serif
    case sansSerif
    case monospace
    case proportionalSerif
    case proportionalSansSerif
    case monospaceSerif
    case monospaceSansSerif
    case casual
    case cursive
    case fantasy
    case smallCapital
    case custom(String)

    var key: String {
        switch self {
            case .custom: return "CMFontFamilyName"
            default: return "CMGenericFontFamilyName"
        }
    }

    var value: String {
        switch self {
            case .default: return "CMGenericFontName_Default"
            case .serif: return "CMGenericFontName_Serif"
            case .sansSerif: return "CMGenericFontName_SansSerif"
            case .monospace: return "CMGenericFontName_Monospace"
            case .proportionalSerif: return "CMGenericFontName_ProportionalSerif"
            case .proportionalSansSerif: return "CMGenericFontName_ProportionalSansSerif"
            case .monospaceSerif: return "CMGenericFontName_MonospaceSerif"
            case .monospaceSansSerif: return "CMGenericFontName_MonospaceSansSerif"
            case .casual: return "CMGenericFontName_Casual"
            case .cursive: return "CMGenericFontName_Cursive"
            case .fantasy: return "CMGenericFontName_Fantasy"
            case .smallCapital: return "CMGenericFontName_SmallCapital"
            case .custom(let value): return value
        }
    }
}
