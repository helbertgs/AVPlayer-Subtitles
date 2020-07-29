import AVFoundation

enum Asset {
    case mov
    case vtt
    case srt
    case m3u8

    var url: URL {
        switch self {
            case .mov:
                return Bundle.main.url(forResource: "Movie", withExtension: "mov") ?? URL(fileURLWithPath: "")
            case .vtt:
                return Bundle.main.url(forResource: "Subtitle", withExtension: "vtt") ?? URL(fileURLWithPath: "")
            case .srt:
                return Bundle.main.url(forResource: "Subtitle", withExtension: "srt") ?? URL(fileURLWithPath: "")
            case .m3u8:
                return URL(string: "http://sample.vodobox.com/planete_interdite/planete_interdite_alternate.m3u8") ?? URL(fileURLWithPath: "")
        }
    }

    var mediaType: AVMediaType {
        switch self {
            case .mov: return .video
            default: return .text
        }
    }
}
