import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Add the diamond image
            Image("diamond")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("I Am Rich")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            Text("Success is mine!")
                .font(.system(size: 20))
                .foregroundColor(.gray)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
