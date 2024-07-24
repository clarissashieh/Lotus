import SwiftUI

struct MoodView: View {
    
    @State  var token = UserDefaults.standard.integer(forKey: "Points")
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some View {
    
        
        NavigationView {
            
        VStack {

            HStack {
            
                
                Spacer()
                    .frame(width: 20)
                
                Image("heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            
                Text("Mood")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 45))
                    .frame(width: 250, height: 45, alignment: .leading)
     
                Spacer()
                
                Text(String(token))
                    .font(Font.custom("PlayfairDisplay-Bold", size: 20))
                    .frame(width: 40, height: 45, alignment: .leading)
               
                Spacer()
                    .frame(width: 20)
               
            }

            
            NavigationLink(destination: ActivitiesView()) {
                Image("activities")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            NavigationLink(destination: MeditationView()) {
                Image("meditation")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            NavigationLink(destination: SoundsView()) {
                Image("sounds")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        }

 }
}



struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}


public func addPoints() {
    AppDelegate.defaults.set(AppDelegate.defaults.integer(forKey: "Points") + 1, forKey: "Points")
    AppDelegate.defaults.synchronize()

}







