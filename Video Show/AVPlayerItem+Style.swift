import AVFoundation

extension AVPlayerItem {
    var style: [Style] {
        get { return [] }
        set { self.textStyleRules = newValue.map { $0.rule } }
    }
}
