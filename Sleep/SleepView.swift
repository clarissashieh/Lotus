//
//  SleepView.swift
//  Lotus
//
//  Created by Clarissa Shieh on 2/27/22.
//
import SwiftUI
import SwiftUICharts

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

struct SleepView: View {
    @AppStorage("weekData") private var weekData = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @AppStorage("avgWakeHr") private var avgWakeHr = 0
    @AppStorage("avgWakeMin") private var avgWakeMin = 0
    @AppStorage("avgBedHr") private var avgBedHr = 0
    @AppStorage("avgBedMin") private var avgBedMin = 0
    @AppStorage("avgHours") private var avgHours = 0.0
    @AppStorage("wakeAmPm") private var wakeAmPm = ""
    @AppStorage("bedAmPm") private var bedAmPm = ""
    @State private var time1 = Date()
    @State private var time2 = Date()
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("sleep")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 64))
                    .frame(width: 360, height: 45, alignment: .leading)
            }
            Text("Your sleep this week:")
                .font(Font.custom("Raleway-Italic", size: 20))
                .frame(width: 360, height: 45, alignment: .leading)
            
            CardView(showShadow: false){
                BarChart()
                ChartLabel("   S         M          T         W         T          F          S", type: .custom(size: 18, padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0), color: .gray))
            }
            .data(weekData.self)
            .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: ColorGradient(.white, .white)))
            .frame(width: 360, height: 240)
            
            Text("Average Bedtime: " + String(format: "%02d", avgBedHr) + ":" + String(format: "%02d", avgBedMin) + bedAmPm)
                .font(Font.custom("Raleway-Regular", size: 18))
                .frame(width: 360, height: 25, alignment: .leading)
            Text("Average Wake-up Time: " + String(format: "%02d", avgWakeHr) + ":" + String(format: "%02d", avgWakeMin) + wakeAmPm)
                .font(Font.custom("Raleway-Regular", size: 18))
                .frame(width: 360, height: 25, alignment: .leading)
            Text("Average Hours of Sleep: " + String(format: "%.2f", avgHours) + " hrs")
                .font(Font.custom("Raleway-Regular", size: 18))
                .frame(width: 360, height: 25, alignment: .leading)
            if avgHours < 8 {
                Text("*Try to get at least 8-10 hours of sleep :(*")
                    .font(Font.custom("Raleway-Regular", size: 14))
                    .frame(width: 360, height: 15, alignment: .leading)
            }
            else{
                Text("*You're on track for sleep! :)*")
                    .font(Font.custom("Raleway-Regular", size: 12))
                    .frame(width: 360, height: 10, alignment: .leading)
            }

            GroupBox(label: Text("Your sleep last night:").font(Font.custom("Raleway-Italic", size: 20))) {
                DatePicker(selection: $time1, label: { Text("Bedtime").font(Font.custom("Raleway-Regular", size: 16)) })
                DatePicker(selection: $time2, label: { Text("Wake-up Time").font(Font.custom("Raleway-Regular", size: 16)) })
                Button(action: {
                    //reset average hours if no data in week
                    if weekData.isEmpty {
                        avgHours = 0
                    }
                    //get data from date pickers
                    let day = Calendar.current.component(.weekday, from: time1)
                    let hrs = time2.timeIntervalSince(time1) / 3600
                    let bedHr = Calendar.current.component(.hour, from: time1)
                    let bedMin = Calendar.current.component(.minute, from: time1)
                    let wakeHr = Calendar.current.component(.hour, from: time2)
                    let wakeMin = Calendar.current.component(.minute, from: time2)
                    
                    //set AM/PM for wake and sleep times
                    if(wakeHr > 12){
                        wakeAmPm = " PM"
                    }
                    else{
                        wakeAmPm = " AM"
                    }
                    if(bedHr > 12){
                        bedAmPm = " PM"
                    }
                    else{
                        bedAmPm = " AM"
                    }
                    
                    //enter inputted data
                    weekData[day - 1] = hrs
                    
                    //update average hours/minutes
                    avgHours = (avgHours + hrs) / Double(day)
                    avgBedHr = Int((avgBedHr + bedHr) / day) % 12
                    avgBedMin = Int((avgBedMin + bedMin) / day)
                    avgWakeHr = Int((avgWakeHr + wakeHr) / day) % 12
                    avgWakeMin = Int((avgWakeMin + wakeMin) / day)
                    
                    //if day is Sunday, reset data to what was just inputted
                    if(day == 1){
                        avgBedMin = bedMin
                        avgBedHr = bedHr % 12
                        avgWakeHr = wakeHr % 12
                        avgWakeMin = wakeMin
                        avgHours = hrs
                        
                        //reset rest of week's data
                        var i = weekData.count - 1
                        while i > 0 {
                            weekData[i] = 0.0
                            i -= 1
                        }
                    }
                }) {
                    Text("Submit").font(Font.custom("Raleway-Regular", size: 18))
                }
            }
            Spacer()
        }
        .background(Color(0xcfe7ea).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
