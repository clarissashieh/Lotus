//
//  SoundsView.swift
//  mood-page
//
//  Created by Cara Lee on 1/17/22.
//

import SwiftUI

struct SoundsView: View {
    
    @State var token = UserDefaults.standard.integer(forKey: "Points")
    
    
    var body: some View {
        
        VStack {
            HStack {
                
                Spacer()
                    .frame(width: 10)
                
            
                Text("Sounds")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 40))
                    .frame(width: 320, height: 45, alignment: .leading)
                
                Spacer()
                
                Text(String(token))
                    .font(Font.custom("PlayfairDisplay-Bold", size: 20))
                    .frame(width: 40, height: 45, alignment: .leading)
                
                Spacer()
            }
                     
                            
            ScrollView {
                VideoEmbed(videoID: "V1RPi2MYptM")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)

                
                VideoEmbed(videoID: "yIQd2Ya0Ziw")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)

                
                VideoEmbed(videoID: "hsGOT_0L16U")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)

                
                VideoEmbed(videoID: "qsOUv9EzKsg")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)

                
                VideoEmbed(videoID: "aH39JaNsSjI")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                   
                
                VideoEmbed(videoID: "q76bMs-NwRk")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    
                
                VideoEmbed(videoID: "WxD_8PTXehY")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
        
                
                VideoEmbed(videoID: "CHFif_y2TyM")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                
            }
        }
    }
}

struct SoundsView_Previews: PreviewProvider {
    static var previews: some View {
        SoundsView()
    }
}

