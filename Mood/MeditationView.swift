//
//  MeditationView.swift
//  mood-page
//
//  Created by Cara Lee on 1/17/22.
//

import SwiftUI

struct MeditationView: View {
    
    @State  var token = UserDefaults.standard.integer(forKey: "Points")
    
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                    .frame(width: 10)
                
            
                Text("Meditation")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 40))
                    .frame(width: 320, height: 45, alignment: .leading)
                
                Spacer()
                
                Text(String(token))
                    .font(Font.custom("PlayfairDisplay-Bold", size: 20))
                    .frame(width: 40, height: 45, alignment: .leading)
                
                Spacer()
            }
                            
            ScrollView {
                                              
                VideoEmbed(videoID: "inpok4MKVLM")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                   
                
                VideoEmbed(videoID: "5vI8Kh3-epg")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                   
                
                VideoEmbed(videoID: "O-6f5wQXSu8")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    
                
                VideoEmbed(videoID: "lVx3mFxML80")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                 
                
                VideoEmbed(videoID: "tuiQxBB67wI")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
              
                
                VideoEmbed(videoID: "86m4RC_ADEY")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)

                
                VideoEmbed(videoID: "tEmt1Znux58")
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                
                
            }
        }
        }
    }
                                              

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}

