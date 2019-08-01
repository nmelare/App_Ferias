//
//  InfoBotaoTableViewCell.swift
//  AppFerias
//
//  Created by Nathalia Melare on 24/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit
import UserNotifications

class InfoBotaoTableViewCell: UITableViewCell {
    

    @IBOutlet weak var botaoAdicionar: UIButton!
    
    
    @IBAction func botaoSabonete(_ sender: Any) {
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                let content = UNMutableNotificationContent()
                content.title = NSString.localizedUserNotificationString(forKey: "Que tal começar algo novo?", arguments: nil)
                content.body = NSString.localizedUserNotificationString(forKey: "Os livros na sua lista estão te esperando!", arguments: nil)
                content.sound = UNNotificationSound.default
                
                
                let date = Date(timeIntervalSinceNow: 3600)
                let triggerDate = Calendar.current.dateComponents([.hour,.minute,.second], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                
                let request = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)
                
                let center = UNUserNotificationCenter.current()
                center.add(request) { (error : Error?) in
                    if let error = error {
                        print(error.localizedDescription)
                        
                        
                        
                    }
                }
                
            }
        }
    
    
    
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
