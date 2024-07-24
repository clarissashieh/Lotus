//
//  InfoView.swift
//  Lotus
//
//  Created by Clarissa Shieh on 4/23/22.
//

import SwiftUI

struct InfoView : View {
    var body: some View {
        VStack{
            VStack{
                Text("info")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 64))
                    .frame(width: 360, height: 45, alignment: .leading)
                Text("Poison Control")
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                Link("1-800-222-1222", destination: URL(string: "tel:1-800-222-1222")!)
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                
                Text("National Suicide Prevention Lifeline")
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)

                Link("800-273-8255", destination: URL(string: "tel:800-273-8255")!)
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                
                Text("Dating Abuse and Domestic Violence")
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                Link("1-866-331-9474", destination: URL(string: "tel:1-866-331-9474")!)
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
            }
            VStack{
                Text("The Trevor Project")
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                Link("866-488-7386", destination: URL(string: "tel:866-488-7386")!)
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
            
                Text("National Eating Disorder Association")
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                Link("1-800-931-2237", destination: URL(string: "tel:1-800-931-2237")!)
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                
                Text("National Alliance on Mental Illness")
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                Link("1-800-950-6264", destination: URL(string: "tel:1-800-950-6264")!)
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                    
                Text("Sexual Assault Hotline")
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
                Link("1-800-656-4673", destination: URL(string: "tel:1-800-656-4673")!)
                    .font(Font.custom("Raleway-Regular", size: 18))
                    .frame(width: 360, height: 25, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(0xc5d9c8).edgesIgnoringSafeArea(.all))
    }
}
