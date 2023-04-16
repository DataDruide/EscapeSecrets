//
//  VideoView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 05.04.23.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    private let player: AVPlayer
    
    init() {
        
        if let videoURL = Bundle.main.url(forResource: "bookingvideo", withExtension: "mp4") {
            self.player = AVPlayer(url: videoURL)
            
        } else {
            
            fatalError("Video URL not found")
        }
        
        // Set up the audio player with an empty URL to mute the audio
        self.player.isMuted = true
    }
    
    var body: some View {
      
        ZStack {
            VideoPlayer(player: player)
                .onAppear() {
                    player.play()
                    
                }
            }
            .ignoresSafeArea()
            .onDisappear() {
                player.pause()
        }
    }
}
