import SwiftUI
import AVKit

struct VideoAssistentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    private let player: AVPlayer
    
    init() {
        // Initialisierung des AVPlayers mit dem Video "FlightAssistent.mp4" aus dem Bundle
        if let videoURL = Bundle.main.url(forResource: "FlightAssistent", withExtension: "mp4") {
            self.player = AVPlayer(url: videoURL)
        } else {
            // Fehlerbehandlung, falls die Video-URL nicht gefunden werden kann
            fatalError("Video URL not found")
        }
        
        // Den Audio-Player mit einer leeren URL einrichten, um den Ton zu stummschalten
        self.player.isMuted = true
    }
    
    var body: some View {
        ZStack {
            // VideoPlayer zur Anzeige des Videos hinzufügen
            VideoPlayer(player: player)
                .onAppear() {
                    // Das Video abspielen, wenn die Ansicht erscheint
                    player.play()
                }
        }
        // Den sicheren Bereich ignorieren, damit das Video über den gesamten Bildschirm abgedeckt wird
        .ignoresSafeArea()
        .onDisappear() {
            // Das Video pausieren, wenn die Ansicht verschwindet
            player.pause()
        }
    }
}

struct VideoAssistentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoAssistentView()
    }
}
