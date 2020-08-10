import AVKit

public enum EdgeStyle: String, Codable, Equatable {
    case none = "CMCharacterEdgeStyle_None"
    case raised = "CMCharacterEdgeStyle_Raised"
    case depressed = "CMCharacterEdgeStyle_Depressed"
    case uniform = "CMCharacterEdgeStyle_Uniform"
    case dropShadow = "CMCharacterEdgeStyle_DropShadow"
}
