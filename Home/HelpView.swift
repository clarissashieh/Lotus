//
//  HelpView.swift
//  Lotus
//
//  Created by Clarissa Shieh on 4/23/22.
//

import SwiftUI

struct HelpView : View {
    var body: some View {
        VStack{
            Text("help")
                .font(Font.custom("PlayfairDisplay-Bold", size: 64))
                .frame(width: 360, height: 55, alignment: .leading)
            VStack{
                Text("To-Do List")
                    .font(Font.custom("Raleway-Italic", size: 20))
                Text("1. Write your task in the task bar\n2. Click Add New\n3. Press done (top right)")
                    .font(Font.custom("Raleway-Regular", size: 18))
                Text("Press the 'Edit' to delete tasks by pressing the red dot. You can also delete without using the 'Edit' button by holding onto the tast and swiping to the right.")
                    .font(Font.custom("Raleway-Regular", size: 18))
                
                Text("Sleep")
                    .font(Font.custom("Raleway-Italic", size: 20))
                Text("1. With the date and time picker, put the bedtime and the wake up time in its respective slot.\n2. Press submit.")
                    .font(Font.custom("Raleway-Regular", size: 18))
                
                Text("Mood")
                    .font(Font.custom("Raleway-Italic", size: 20))
                Text("Under 'mood' resources for calming activities, meditation and relaxing sounds will open.\nBy clicking on the box, videos for each category will be shown.")
                    .font(Font.custom("Raleway-Regular", size: 18))
                
                Text("Nutrition")
                .font(Font.custom("Raleway-Italic", size: 20))
                Text("Find recipies for breakfast,lunch,dinner and snacks under nutrition.")
                    .font(Font.custom("Raleway-Regular", size: 18))
                Text("Access the recipies by clicking the box for the wanted category.")
                    .font(Font.custom("Raleway-Regular", size: 18))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(0xc5d9c8).edgesIgnoringSafeArea(.all))
    }
}
