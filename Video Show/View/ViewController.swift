import AVKit
import UIKit

class ViewController: AVPlayerViewController {

    // MARK: Private Property(ies).

    private var composition = AVMutableComposition()

    // MARK: - Constructor(s).

    init() {
        super.init(nibName: nil, bundle: nil)
        self.online()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.online()
//        self.offline()
    }

    // MARK: - Private Function(s).

    private func online() {
        self.player = AVPlayer(url: Asset.m3u8.url)
        self.style()
    }

    private func offline() {
        self.setup(asset: .mov)
        self.setup(asset: .vtt)

        self.player = AVPlayer(playerItem: AVPlayerItem(asset: self.composition))
        self.style()
    }

    func setup(asset: Asset) {
        let media = AVURLAsset(url: asset.url)
        let track: AVMutableCompositionTrack? = self.composition.addMutableTrack(withMediaType: asset.mediaType, preferredTrackID: kCMPersistentTrackID_Invalid)

        do {
            if media.tracks.count > 0 {
                try? track?.insertTimeRange(CMTimeRange(start: CMTime.zero, duration: media.duration),
                                            of: media.tracks(withMediaType: asset.mediaType)[0],
                                            at: .zero)
            }

            kCMTextMarkupAttribute_BackgroundColorARGB
        }
    }

    private func style() {
        player?.currentItem?.textStyle = [
            .edge(.dropShadow),
//            .background(.clear),
//            .characterBackground(.clear),
            .foreground(.white),
            .font(.custom("Clear Sans")),
//            .fontSize(5)
        ]
    }
}
