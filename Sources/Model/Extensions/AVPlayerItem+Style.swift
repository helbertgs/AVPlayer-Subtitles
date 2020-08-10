import AVFoundation

public extension AVPlayerItem {
    var textStyle: [TextStyle] {
        get { return [] }
        set { self.textStyleRules = newValue.map { $0.value } }
    }
}
