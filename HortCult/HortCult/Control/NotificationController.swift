import SwiftUI
import UserNotifications

//let opcoes2 : [String : Double] = ["Diariamente": 86400, "2 em 2 dias":172800, "4 em 4 dias":345600, "Semanalmente":604800]
class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Permissão concedida")
            } else {
                print("Permissão negada")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Título da Notificação"
        content.body = "Corpo da Notificação"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: false)
        
        let request = UNNotificationRequest(identifier: "delayedNotification", content: content, trigger: trigger)
        
        let notificationDate = Date().addingTimeInterval(trigger.timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let notificationDateString = dateFormatter.string(from: notificationDate)
        
        print("Notificação agendada para: \(notificationDateString)")
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Erro ao agendar a notificação: \(error.localizedDescription)")
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let content = response.notification.request.content
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: false)
        
        let request = UNNotificationRequest(identifier: "delayedNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Erro ao reagendar a notificação: \(error.localizedDescription)")
            }
        }
        
        completionHandler()
    }
}

