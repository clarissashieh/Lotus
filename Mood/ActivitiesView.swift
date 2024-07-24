//
//  ActivitiesView.swift
//  mood-page
//
//  Created by Cara Lee on 1/17/22.
//

import SwiftUI

struct ActivitiesView: View {
    
    @State  var token = UserDefaults.standard.integer(forKey: "Points")
    
    
    var body: some View {
        VStack {
            HStack {
                

                Spacer()
                    .frame(width: 10)
                
            
                Text("Activities")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 40))
                    .frame(width: 320, height: 45, alignment: .leading)
                
                Spacer()
                
                Text(String(token))
                    .font(Font.custom("PlayfairDisplay-Bold", size: 20))
                    .frame(width: 40, height: 45, alignment: .leading)
                
                
                Spacer()
            }
                     
                            
            ScrollView {
                VideoEmbed(videoID: "cZdO2e8K29o")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)

                
                VideoEmbed(videoID: "LWsL-_pgmTc")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                   
                
                VideoEmbed(videoID: "GMSC95hEj2w")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                   
                VideoEmbed(videoID: "TavJrDi2BhA")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                   
                
                VideoEmbed(videoID: "T9efJ868yxo")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    
                VideoEmbed(videoID: "OiSzGBguPm0")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    
                
            }
        }
    }
}



struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
