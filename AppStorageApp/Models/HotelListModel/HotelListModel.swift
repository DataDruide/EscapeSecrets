//
//  HotelListModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//


import Foundation
import SwiftUI

//MARK: MODEL

struct Hotels : Identifiable {
   
    var id = UUID()
    let name : String
    let title: String
    let image : String
    var rating: Int
    let description : String
    let price : Int
    let amenities: [String]

   
    
}
// Fake Hoteldaten

private var hotel1 = Hotels(name: "Italien",title: "Schloss · Gastgeber:in ist Nicola", image: "Italien",  rating: 3, description: "Tolles Panorama-Schloss mit großem Pool. Die Unterkunft ist von Weinbergen und Olivenhainen umgeben! Das Hotel liegt im Herzen der Toskana zwischen Florenz und Siena! Ein Bahnhof ist nur 1 km entfernt! WLAN funktioniert immer im gesamten Anwesen. Klimaanlage. 5 Doppelzimmer, 6 Badezimmer. Ein sehr großer Wohnbereich, ideal für Veranstaltungen! Viele Terrassen mit Aussicht und ein erstaunlicher großer Innenhof, von dem aus du direkten Zugang zur kleinen privaten Kirche des Schlosses hast",price: 900, amenities: ["Kamin", "Küche", "Terrasse", "WLAN"])
private var hotel2 = Hotels(name: "Kanada",title: "Gesamte Unterkunft: Cottage, Gastgeber ist David", image: "Kanada", rating: 4, description: "Willkommen in Muskoka A-Rahmen, dem perfekten Pärchenausflug oder Solo-Retreat, eingebettet in das wunderschöne Hidden Valley. Dieser klassische A-Rahmen aus den 70er Jahren wurde für die moderne Welt neu gestaltet. Wache mit schwankenden Baumkronen auf, mache Gourmet-Mahlzeiten zu und entspanne dich am Feuer mit zweistöckigem Waldblick.",price: 345, amenities: ["Kamin", "Rustikale Küche", "Terrasse mit Garten", "WLAN Standleitung"])
private var hotel3 = Hotels(name: "Tokio",title:"Gesamte Unterkunft: Privatunterkunft · Gastgeber:in ist Seadiners", image: "Tokio", rating: 3, description: "3 Minuten zu Fuß zum Sunrise Beach. Zu den Aktivitäten gehören ein Außenpool, ein Grill auf dem Char-Broil-Grill, eine Fass-Sauna mit Harvia-Saunaheizung, ein Innen-Whirlpool im Freien mit LED-Licht, Hundeabfahrten mit Ihrem Hund und Surfen im Meer vor Ihnen.",price: 326, amenities: ["offenes Feuer", "küche", "Wald", "Kabel"])
private var hotel4 = Hotels(name: "Finnland",title:"Gesamte Unterkunft: Chalet · Gastgeber:in ist Tanja", image: "Finnland", rating: 5, description: "Dies ist ein hochwertiges und gut ausgestattetes Chalet mit 4 Schlafzimmern im schönen Lappland.Es ist 200 m zu den Pisten, Skibushaltestelle nebenan und Levi Dorf 10min entfernt.Das Chalet verfügt über eine geräumige, offene Küche/Lounge mit großen Fenstern",price: 141, amenities: ["Kamin", "Küche", "Terrasse", "WLAN"])
private var hotel5 = Hotels(name: "Suedkorea",title:"Privater Gastgeber", image: "Suedkorea", rating: 4, description: "Hanok Stay Emotional Day befindet sich im Zentrum von Taejo-ro, Jeonju Hanok Village. Nahe gelegene Sehenswürdigkeiten (Concubine, Jeonjeon-Kathedrale, Gyeonggi Pre-Gyeonggi, Hyanggyo usw.) sind 5 Minuten entfernt.Es befindet sich neben der Hauptstraße mit vielen Essensbügeln, und es ist ein sauberer und ziemlich Einfamilien-Hangok-Aufenthalt.",price: 188, amenities: ["Kamin", "Küche", "Terrasse", "WLAN"])
private var hotel6 = Hotels(name: "CostaRica",title:"Gesamte Unterkunft: Villa · Gastgeber:in ist Petra", image: "CostaRica", rating: 5, description: "Überschreiten Sie die Grenzen zwischen Innen und Außen. Schieben Sie die Wände auf, rutschen Sie durch und sehen Sie die markante Weite der Außenwelt. Direkt über dem schönen Strand mit Meerblick und Dschungel. Gerade in Wall Paper, Dezeen usw. veröffentlicht.",price: 755, amenities: ["Bungalow", "Einheimische", "Garten", "WLAN"])


// gefüllte HotelListe mit den oben aufgeführten Hotels
struct HotelModel {
    
    var hotelsList : [Hotels] = [hotel1,hotel2,hotel3,hotel4,hotel5,hotel6]
    
}
