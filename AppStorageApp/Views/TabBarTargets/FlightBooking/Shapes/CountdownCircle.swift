
import SwiftUI


struct CountdownCircle: View {
    let remainingTime: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.white)
            
            Text("\(formattedTime)")
                .font(.headline)
                .foregroundColor(.white)
        }
    }
    var formattedTime: String {
        let hours = Int(remainingTime) / 3600
        let minutes = Int(remainingTime) / 60 % 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

}


struct CountdownCircle_Previews: PreviewProvider {
    static var previews: some View {
        CountdownCircle(remainingTime: 0.60)
    }
}
