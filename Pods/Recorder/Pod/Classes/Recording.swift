import AVFoundation

@objc public protocol RecorderDelegate: AVAudioRecorderDelegate {
    @objc optional func audioMeterDidUpdate(dB: Float)
}

public class Recording : NSObject {
    public var delegate: RecorderDelegate!
    
    var session: AVAudioSession!
    var recorder: AVAudioRecorder!
    public var player: AudioPlayer!
    public var url: URL!
    
    var bitRate = 192000
    var sampleRate = 44100.0
    var channels = 1
    
    var metering: Bool {
        return delegate.responds(to: Selector(("audioMeterDidUpdate:")))
    }
    
    var directory: NSString {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
    }
    
    private var link: CADisplayLink?
    
    public init(to: NSString)
    {
    session  = AVAudioSession.sharedInstance()
    
    super.init()
    
    url = NSURL(fileURLWithPath: directory.appendingPathComponent(to as String)) as URL
    }
    
    public func prepare()
    {
    recorder = try? AVAudioRecorder(url: url as URL, settings: [
        AVFormatIDKey: kAudioFormatMPEG4AAC,
        AVEncoderAudioQualityKey: AVAudioQuality.low.rawValue,
        AVEncoderBitRateKey: bitRate,
        AVNumberOfChannelsKey: channels,
        AVSampleRateKey: sampleRate
    ])
    recorder.prepareToRecord()
    
    recorder.delegate = delegate
    recorder.isMeteringEnabled = metering
    }
    
    public func record()
    {
    if recorder == nil {
        prepare()
    }
    
    if metering {
        startMetering()
    }
    
    try? session.setCategory(AVAudioSession.Category.record)
    
    recorder.record()
    }
    
    public func stop()
    {
    recorder?.stop()
    
    do {
        try session?.setCategory(AVAudioSession.Category.playback)
        player = AudioPlayer(cutomeUrl: url)
    }catch {
        print("\(error)")
    }
    
    if metering {
        stopMetering()
    }
    }
    
    public func play()
    {
    player?.play()
    }
    
    public func updateMeter()
    {
    recorder.updateMeters()
    
    let dB = recorder.averagePower(forChannel: 0)
    
    delegate.audioMeterDidUpdate?(dB: dB)
    }
    
    private func startMetering()
    {
    link = CADisplayLink(target: self, selector: Selector(("updateMeter")))
    link?.add(to: RunLoop.current, forMode: RunLoop.Mode.common)
    }
    
    private func stopMetering()
    {
    link?.invalidate()
    }
    
}
