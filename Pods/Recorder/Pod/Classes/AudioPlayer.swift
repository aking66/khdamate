
import AVFoundation
import AVKit
import UIKit

extension AVPlayer {
    open var isPlaying: Bool {
        if self.rate != 0 && self.error == nil {
            return true
        } else {
            return false
        }
    }
}

internal extension Double {
    var bs_cmTime: CMTime {
        return CMTimeMakeWithSeconds(self, preferredTimescale: 1)
    }
}

internal extension String {
    var isRemoteFile: Bool { if self.contains("http") {
        return true
    }
    return false
    }
}

open class AudioPlayer: AVPlayer {
//    public enum ThreadType{
//       case background
//       case main
//    }
    public enum PlayerSate {
        // rate=1
        case play
        // rate=0
        case pause
        case finish
        case readyToPlay
        case failed
        case unknown
        case failedToPlayToEndTime
        case timeJumped
        case playbackStalled
        // show loader
        case playbackBufferEmpty
        // Buffering
        case playbackLikelyToKeepUp
        // hide loader
        case playbackBufferFull
        case timeControlStatusPaused
        case timeControlStatusPlaying
        case waitingToPlayAtSpecifiedRate
    }

    public typealias PlayerStateHandler = (PlayerSate?) -> Void
    // is buffering or not
    public typealias PlaybackLikelyToKeepUpHandler = (Bool) -> Void
    public typealias CurrentTimerHandler = (TimeInterval) -> Void
    public var currentItemURL:URL?
    open var enableCurrentTimerHandler: Bool = true

    private var playerSate: PlayerSate? {
        didSet {
            playerStateHandler?(self.playerSate)
        }
    }

//    open var threadType:ThreadType = .main{
//        didSet{
//            if threadType == .background{
//                self.backgroundThread = DispatchQueue(label: "com.salahmohamed.VideoAudioPlayerKit", attributes: .initiallyInactive);
//            }
//        }
//    }
    open var playerStateHandler: PlayerStateHandler?
    open var playbackLikelyToKeepUpHandler: PlaybackLikelyToKeepUpHandler?
    open var currentTimerHandler: CurrentTimerHandler?

    private var timeObserverToken: Any?
//    private var backgroundThread:DispatchQueue?;
//    open var currentThread:DispatchQueue{
//        get{
//        switch self.threadType{
//        case .background:
//        return backgroundThread ?? DispatchQueue.main
//        case .main:
//        return DispatchQueue.main
//        }
//        }
//    }
    open var isPlaybackBufferEmpty: Bool? { return self.currentItem?.isPlaybackBufferEmpty }
    open var isPlaybackBufferFull: Bool? { return self.currentItem?.isPlaybackBufferFull }
    open var isPlaybackLikelyToKeepUp: Bool? { return self.currentItem?.isPlaybackLikelyToKeepUp }
    override init() {
        super.init()

        self.setAllObserver()
    }

    deinit {
        removeAllObserver()
    }

    fileprivate func setAllObserver() {
        self.addObserver(self, forKeyPath: "status", options: [], context: nil)
        self.addObserver(self, forKeyPath: "rate", options: [], context: nil)
        // self.addObserver(self, forKeyPath:"playerSate", options:[.old, .new], context: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(AudioPlayer.playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(AudioPlayer.playerFailedToPlayToEndTime(note:)), name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AudioPlayer.timeJumped(note:)), name: NSNotification.Name.AVPlayerItemTimeJumped, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AudioPlayer.playbackStalled(note:)), name: NSNotification.Name.AVPlayerItemPlaybackStalled, object: nil)

        self.currentItem?.addObserver(self, forKeyPath: "playbackBufferEmpty", options: .new, context: nil)
        self.currentItem?.addObserver(self, forKeyPath: "playbackLikelyToKeepUp", options: .new, context: nil)
        self.currentItem?.addObserver(self, forKeyPath: "playbackBufferFull", options: .new, context: nil)
        self.currentItem?.addObserver(self, forKeyPath: "timeControlStatus", options: .new, context: nil)
        self.addPeriodicTimeObserver()
    }

    fileprivate func removeAllObserver() {
        self.removeObserver(self, forKeyPath: "status")
        self.removeObserver(self, forKeyPath: "rate")
        // self.removeObserver(self, forKeyPath: "playerSate")

        // self.currentItem?.removeObserver(self, forKeyPath: "playbackBufferEmpty")
        // self.currentItem?.removeObserver(self, forKeyPath: "playbackLikelyToKeepUp")
        // self.currentItem?.removeObserver(self, forKeyPath: "playbackBufferFull")
        // self.currentItem?.removeObserver(self, forKeyPath: "timeControlStatus")

        NotificationCenter.default.removeObserver(self)
    }

    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "playerSate"{
//            playerStateHandler?(self.playerSate);
//        }else
        if keyPath == "status" {
            if self.currentItem?.status == AVPlayerItem.Status.readyToPlay {
                self.playerSate = .readyToPlay
            } else
            if self.currentItem?.status == AVPlayerItem.Status.failed {
                self.playerSate = .failed
            } else
            if self.currentItem?.status == AVPlayerItem.Status.unknown {
                self.playerSate = .unknown
            }
        } else
        if keyPath == "rate" {
            if self.rate == 0 {
                self.playerSate = .pause
            } else
            if self.rate == 1 {
                self.playerSate = .play
            }
        } else
        if keyPath == "playbackBufferEmpty" {
            self.playerSate = .playbackBufferEmpty
        } else
        if keyPath == "playbackLikelyToKeepUp" {
            self.playerSate = .playbackLikelyToKeepUp
        } else
        if keyPath == "playbackBufferFull" {
            self.playerSate = .playbackBufferFull

        } else
        if keyPath == "timeControlStatus" {
            if #available(iOS 10.0, *) {
                if self.timeControlStatus == AVPlayer.TimeControlStatus.paused {
                    self.playerSate = .timeControlStatusPaused
                } else if self.timeControlStatus == AVPlayer.TimeControlStatus.playing {
                    self.playerSate = .timeControlStatusPlaying
                } else
                if self.timeControlStatus == AVPlayer.TimeControlStatus.waitingToPlayAtSpecifiedRate {
                    self.playerSate = .waitingToPlayAtSpecifiedRate
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }

    public init(asset: AVAsset) {
        super.init(playerItem: AVPlayerItem(asset: asset))
    }

    public init(url: String /* ,_ threadType:ThreadType = .main */ ) {
        if url.isRemoteFile {
            super.init(playerItem: AVPlayerItem(url: URL(string: url)!))
            currentItemURL = URL(string: url)
        } else {
            super.init(playerItem: AVPlayerItem(url: URL(fileURLWithPath: url)))
            currentItemURL = URL(fileURLWithPath: url)
        }

//        self.threadType=threadType;
    }

    public init(cutomeUrl: URL /* ,_ threadType:ThreadType = .main */ ) {
        if cutomeUrl.absoluteString.isRemoteFile {
            super.init(playerItem: AVPlayerItem(url: cutomeUrl))
        } else {
            super.init(playerItem: AVPlayerItem(url: cutomeUrl))
        }
        currentItemURL = cutomeUrl
//        self.threadType=threadType;
    }

    @objc private func playerDidFinishPlaying(note: NSNotification) {
        self.playerSate = .finish
    }

    @objc private func playerFailedToPlayToEndTime(note: NSNotification) {
        self.playerSate = .failedToPlayToEndTime
    }

    @objc private func timeJumped(note: NSNotification) {
        self.playerSate = .timeJumped
    }

    @objc private func playbackStalled(note: NSNotification) {
        self.playerSate = .playbackStalled
    }

    open func seekTo(value: Double) {
        self.seek(to: value.bs_cmTime)
    }

    open func stop() {
        self.pause()
        self.seekTo(value: 0)
    }

    open func addPeriodicTimeObserver() {
        // Invoke callback every  second
//        let interval = CMTime(seconds: 1.0,
//                              preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        // Queue on which to invoke the callback
        // Add time observer
        self.timeObserverToken =
            self.addPeriodicTimeObserver(forInterval: 1.0.bs_cmTime, queue: DispatchQueue.main) {
                [weak self] _ in
                // update player transport UI
                let playbackLikelyToKeepUp = self?.currentItem?.isPlaybackLikelyToKeepUp
                self?.playbackLikelyToKeepUpHandler?(playbackLikelyToKeepUp ?? false)
//                if playbackLikelyToKeepUp == false{
//                assert(false,"start the activity indicator")
//                }else{
//                assert(false,"stop the activity indicator")
//                }
                if self?.enableCurrentTimerHandler ?? true {
                    if (self?.currentItem?.currentTime().seconds ?? 0) > 0.0 {
                        self?.currentTimerHandler?(self?.currentItem?.currentTime().seconds ?? 0)
                    }
                }
            }
    }

    open func removeTimeObserver() {
        if self.timeObserverToken != nil {
            self.removeTimeObserver(self.timeObserverToken!)
            self.timeObserverToken = nil
        }
    }

    // handlers
    open func playerStateHandler(playerStateHandler: @escaping PlayerStateHandler) {
        self.playerStateHandler = playerStateHandler
    }

    open func playbackLikelyToKeepUpHandler(playbackLikelyToKeepUpHandler: @escaping PlaybackLikelyToKeepUpHandler) {
        self.playbackLikelyToKeepUpHandler = playbackLikelyToKeepUpHandler
    }

    open func currentTimerHandler(currentTimerHandler: @escaping CurrentTimerHandler) {
        self.currentTimerHandler = currentTimerHandler
    }
}
