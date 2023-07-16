//
//  AudioPlayer.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 31.03.23.
//

// Importieren der benötigten Frameworks
import Foundation
import AVFoundation

// Definition einer optionalen Variablen vom Typ AVAudioPlayer
var audioPlayer: AVAudioPlayer?

// Funktion, die einen Sound abspielt
func playSound(sound: String, type: String) {
    
    // Überprüfen, ob es eine gültige Pfadangabe für die Sounddatei gibt
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            // Initialisierung des AVAudioPlayer-Objekts mit dem Pfad zur Sounddatei
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // Abspielen des Sounds
            audioPlayer?.play()
        } catch {
            // Fehlerbehandlung, wenn das AVAudioPlayer-Objekt nicht initialisiert werden kann
            print("Could not play the sound file.")
        }
    }
}
