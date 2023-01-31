/************************* Mo’min J.Abusaada *************************/
//
//  ChatOrderTextTableViewCell.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 07/03/2021.
//

import UIKit
import Recorder
import AudioToolbox

class ChatOrderVoiceTableViewCell : GeneralTableViewCell {

    @IBOutlet weak var viewContaner: customMaskUIView!
    @IBOutlet var btnPlay: roundedButton!
    @IBOutlet var sliderPlayer: UISlider!
    @IBOutlet var lblPlayTime: UILabel!
    @IBOutlet weak var LayoutConstraintRight: NSLayoutConstraint!
    @IBOutlet weak var LayoutConstraintLeft: NSLayoutConstraint!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func configerCell() {
        let obj = self.object.object as! TChatObject
        let pVC = self.parentVC as! ChatOrderViewController
        
        if obj.my_messsage?.boolValue == true {
            self.viewContaner.roundCorners(roundshapeType: .allCournerWithoutTopRightCorner, radius: 10)
            self.viewContaner.backgroundColor = UIColor(named: "#00A1C3")
            self.LayoutConstraintRight.priority = UILayoutPriority(rawValue: 1000)
            self.LayoutConstraintLeft.priority = UILayoutPriority(rawValue: 250)
            self.lblPlayTime.textColor = .white
            self.sliderPlayer.minimumTrackTintColor = .white
        }else {
            self.viewContaner.roundCorners(roundshapeType: .allCournerWithoutTopLeftCorner, radius: 10)
            self.viewContaner.backgroundColor = .white
            self.LayoutConstraintRight.priority = UILayoutPriority(rawValue: 250)
            self.LayoutConstraintLeft.priority = UILayoutPriority(rawValue: 1000)
            self.lblPlayTime.textColor = UIColor(named: "#2B2B2B")
            self.sliderPlayer.minimumTrackTintColor = UIColor(named: "#00A1C3")
        }
        
        if pVC.recording.player?.isPlaying == true && pVC.recording.player.currentItemURL?.absoluteString == obj.value && self == pVC.tempVoiceCell{
            self.btnPlay.setImage(UIImage(named: "ic_order_create_pause_full"), for: .normal)
        } else {
            self.btnPlay.setImage(UIImage(named: "ic_order_create_player_full"), for: .normal)
        }
    }
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    @IBAction func btnPlay(_ sender: Any) {
        let pVC = self.parentVC as! ChatOrderViewController
        let obj = self.object.object as! TChatObject

        guard let url = URL(string: obj.value ?? "") else {
            return
        }
        if pVC.recording.player.currentItemURL?.absoluteString != obj.value {
            pVC.recording.player.stop()
            //self.tableView.reloadData()
            pVC.recording.player = AudioPlayer(cutomeUrl: url)
        }
        if pVC.recording.player?.isPlaying == true {
            pVC.recording.player.stop()
            pVC.tempVoiceCell = nil
            self.btnPlay.setImage(UIImage(named: "ic_order_create_player_full"), for: .normal)
        } else {
            if let current = pVC.recording.player?.currentItem?.currentTime(), let duration = pVC.recording.player?.currentItem?.duration, current.isValid == true, duration.seconds > 0, Int(current.seconds) == Int(duration.seconds) {
                pVC.recording.player?.seekTo(value: 0)
            }
            pVC.recording.player.stop()
          //  self.tableView.reloadData()
            
            pVC.recording.player = AudioPlayer(cutomeUrl: url)
            pVC.recording.play()
            self.btnPlay.setImage(UIImage(named: "ic_order_create_pause_full"), for: .normal)
            pVC.tempVoiceCell = self
        }
        
        pVC.recording.player?.currentTimerHandler(currentTimerHandler: {[weak self] time in
            guard let self = self else {return}
            guard self == pVC.tempVoiceCell else {
                return
            }
            var duration = pVC.recording.player?.currentItem?.duration.seconds ?? 0.0
            if duration <= 1.0 {
                duration = 1.0
            }
//            if pVC.recording.player.currentItemURL?.absoluteString != obj.value {
//                obj.duration = Float(duration)
//                obj.currentDuration = Float(time)
//            }
//            self.sliderPlayer.maximumValue = obj.duration ?? 0.0
//            self.sliderPlayer.setValue(obj.currentDuration ?? 0.0, animated: true)
//            print("time plaing is : \(obj.currentDuration ?? 0.0)")
            self.sliderPlayer.maximumValue = Float(duration)
            self.sliderPlayer.setValue(Float(time), animated: true)
            print("time plaing is : \(time)")
            
//            self.hmsFrom(seconds: Int(obj.currentDuration ?? 0.0)) { _, minutes, seconds in
            self.hmsFrom(seconds: Int(time)) { _, minutes, seconds in

                let minutes = self.getStringFrom(seconds: minutes)
                let seconds = self.getStringFrom(seconds: seconds)
                
                self.lblPlayTime.text = "\(minutes):\(seconds)"
            }
        })
        pVC.recording.player?.playerStateHandler(playerStateHandler: {[weak self] _ in
            guard let self = self else {return}
            guard self == pVC.tempVoiceCell else {
                return
            }
            if pVC.recording.player?.isPlaying ?? false {
                self.btnPlay.setImage(UIImage(named: "ic_order_create_pause_full"), for: .normal)
                self.sliderPlayer.value = 0
                self.lblPlayTime.text = "00:00"
            } else {
                self.btnPlay.setImage(UIImage(named: "ic_order_create_player_full"), for: .normal)
            }
        })
    }
    func getStringFrom(seconds: Int) -> String {
        return seconds < 10 ? "0\(seconds)" : "\(seconds)"
    }
    
    func hmsFrom(seconds: Int, completion: @escaping (_ hours: Int, _ minutes: Int, _ seconds: Int) -> Void) {
        completion(seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}
