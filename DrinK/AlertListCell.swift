//
//  AlertListCell.swift
//  DrinK
//
//  Created by HwangByungJo  on 2022/06/20.
//

import UIKit
import UserNotifications

class AlertListCell: UITableViewCell {
  
  let userNotificationCenter = UNUserNotificationCenter.current()
  
  @IBOutlet weak var meridiemLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  @IBOutlet weak var alertSwitch: UISwitch!
  
  
  func updateCell(data: Alert) {
    
    alertSwitch.isOn = data.isOn
    timeLabel.text = data.time
    meridiemLabel.text = data.meridiem
  }
  
  @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
    
    guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
          var alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return }
    
    alerts[sender.tag].isOn = sender.isOn
    UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alerts")
    
    if sender.isOn {
      userNotificationCenter.addNotificationRequest(by: alerts[sender.tag])
    } else {
      userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[sender.tag].id])
    }
    
  }
}
