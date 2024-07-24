//
//  NutritionView.swift
//  Lotus
//
//  Created by Cara Lee on 1/28/22.
//

import SwiftUI

struct NutritionView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("nutrition")
                .font(Font.custom("PlayfairDisplay-Bold", size: 64))
                .frame(width: 360, height: 40, alignment: .leading)
            HStack {
                NavigationLink(destination: BreakfastView()) {
                    Image("breakfast")
                        .resizable()
                        .scaledToFit()
                        .padding(.leading)
                        .padding(.top)
                }
                NavigationLink(destination: LunchView()) {
                    Image("lunch")
                        .resizable()
                        .scaledToFit()
                        .padding(.trailing)
                        .padding(.top)
                }
            }
            HStack {
                NavigationLink(destination: DinnerView()) {
                    Image("dinner")
                        .resizable()
                        .scaledToFit()
                        .padding(.leading)
                        .padding(.bottom)
                }
                NavigationLink(destination: SnackView()) {
                    Image("snack")
                        .resizable()
                        .scaledToFit()
                        .padding(.trailing)
                        .padding(.bottom)
                }
            }
            Spacer()
            Spacer()
            
        }
        .background(Color(0xdecebb).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
