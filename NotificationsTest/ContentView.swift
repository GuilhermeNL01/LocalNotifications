//
//  ContentView.swift
//  NotificationsTest
//
//  Created by Guilherme Nunes Lobo on 27/10/23.
//
import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Permitir Notificações") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                    if granted {
                        print("Permissão concedida para notificações")
                    } else {
                        print("Permissão negada para notificações")
                    }
                }
            }
            
            Button("Agendar Notificação") {
                let content = UNMutableNotificationContent()
                content.title = "Título da Notificação"
                content.body = "Corpo da Notificação"
                content.sound = UNNotificationSound.default

                // Configura o disparo da notificação (quando ela será exibida)
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // 10 segundos

                // Cria a solicitação de notificação
                let request = UNNotificationRequest(identifier: "MinhaNotificacao", content: content, trigger: trigger)

                // Adiciona a solicitação ao centro de notificações
                UNUserNotificationCenter.current().add(request) { (error) in
                    if let error = error {
                        print("Erro ao agendar notificação: \(error.localizedDescription)")
                    } else {
                        print("Notificação agendada com sucesso")
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
