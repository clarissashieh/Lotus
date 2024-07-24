//
//  HomeView.swift
//  Lotus
//
//  Created by Nadia Iskandar on 3/31/22, Clarissa Shieh 4/16/23
//

import SwiftUI
import Combine
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()

    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error{
                print("ERROR: \(error)")
            }
            else{
                print("SUCESS")
            }
        }
    }
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Reminder: You got this!"
        content.subtitle = "Keep up the good work! I believe in you! :)"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10800, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct HomeView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
   
    var searchBar : some View {
        HStack {
            TextField("Enter a new task", text: self.$newToDo)
            Button(action: self.addNewToDo, label: {
                Text("Add New")
            
            })
        }
    }

    
    func addNewToDo() {
        taskStore.tasks.append(Task(id:String(taskStore.tasks.count + 1), toDoItem: newToDo))
        self.newToDo = ""
    }
   
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("hello!").font(Font.custom("PlayfairDisplay-Bold", size: 64))
                        .frame(width: 300, height: 45, alignment: .leading)
                    NavigationLink(destination: InfoView()) {
                        Image("info.circle")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .trailing)
                    }
                    NavigationLink(destination: HelpView()) {
                        Image("questionmark.circle")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .trailing)
                    }
                }
                let arrayOfQuotes = ["Keep up the good work!", "It's okay to ask for help.","You're worth it :)","Everything will be okay in the end.","Make the day count!","The best is yet to come.","You got this!","Don't forget to take a break!"]
                let randomNum = Int.random(in: 0...(arrayOfQuotes.count-1))
                let quote = arrayOfQuotes[randomNum]
                Text(quote)
                    .font(Font.custom("Raleway-Italic", size: 20))
                    .frame(width: 360, height: 30, alignment: .leading)
                
                Button("Click to allow notifications!"){
                    NotificationManager.instance.requestAuthorization()
                    NotificationManager.instance.scheduleNotification()
                }.onAppear(){
                    UIApplication.shared.applicationIconBadgeNumber = 0
                }
                
                Text("To-Do List")
                    .font(Font.custom("Raleway-Regular", size: 36))
                    .frame(width: 360, height: 40, alignment: .leading)
                searchBar.padding()
                    .padding()
                
                List {
                    ForEach(self.taskStore.tasks) {
                        task in
                        Text(task.toDoItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                        
                }
                .navigationBarItems(trailing: EditButton())
                Spacer()
            }
            .background(Color(0xc5d9c8).edgesIgnoringSafeArea(.all))
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    func move(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets :offsets)
    }
}
