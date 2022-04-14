//
//  ContentView.swift
//  Project21
//
//  Created by Jaehwa Noh on 2022/04/12.
//

import SwiftUI
import UserNotifications

struct NotiView: View {
    var body: some View {
        Button("나에게 알려줘.") {
            addNotification()
        }
    }
    
    func addNotification() {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "씨앗"
            content.subtitle = "씨앗이 나온다."
            content.sound = UNNotificationSound.default
            
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        center.getNotificationSettings {settings in
            if settings.authorizationStatus == .authorized {
                // 권한 요청
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) {
                    success, error in
                    if success {
                        // 권한 요청
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
        
    }
    
    
}

struct NotiView_Previews: PreviewProvider {
    static var previews: some View {
        NotiView()
    }
}
