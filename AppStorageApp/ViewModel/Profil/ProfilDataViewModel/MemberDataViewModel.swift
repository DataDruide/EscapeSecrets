//
//  MemberDataViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 15.03.23.
//

import Foundation
import CoreData
import SwiftUI

// ObservableObject ist ein Protokoll von SwiftUI, das die Klasse als ein Objekt kennzeichnet,
// das sich ändern kann und benachrichtigt andere Teile des Codes über Änderungen.
// @MainActor ist ein Attribut, das angibt, dass die Klasse auf dem Haupt-Thread ausgeführt wird.
@MainActor class MemberDataViewModel : ObservableObject{

    // @Published ist ein Attribut, das angibt, dass Änderungen an der Variablen von anderen Teilen des Codes beobachtet werden können.
    // NavigationPath ist eine von der Klasse erstellte Datenstruktur, die den Navigationspfad in der App speichert.
    @Published var navPath = NavigationPath()

    // NSPersistentContainer ist eine Klasse von CoreData, die die Kern-Daten-Stack-Infrastruktur bereitstellt.
    // Der Persistent Container wird verwendet, um auf die CoreData-Modellobjekte zuzugreifen.
    let container : NSPersistentContainer
    
    // @Published macht es manipulierbar

    // Ein Array von UserEntity-Objekten, das aus der CoreData-Datenbank geladen wird.
    @Published var savedUserDaten : [UserEntity] = []

    // Initialisierungsfunktion der Klasse.
    init(){

        // Initialisierung des Persistent Containers.
        container = NSPersistentContainer(name: "MemberContainer")

        // Laden des CoreData-Speichers.
        container.loadPersistentStores { desc, error in
            if let error = error{
                print("Fehler beim Laden der Personendaten. \(error)")
            }else{
                print("Personendaten wurden erfolgreich geladen.")
            }
        }

        //Function Mitglieder Daten wird aufgerufen.
        fetchMemberData()
    }

    // Funktion, um die Mitglieder Daten zu aktualisieren.
    func updateMemberData(MemberData: UserEntity){
        MemberData.done.toggle()
        saveData()
    }

    // Funktion, um Mitgliederdaten aus der CoreData-Datenbank abzurufen.
    func fetchMemberData(){
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        do{
            savedUserDaten = try container.viewContext.fetch(request)
        } catch let error{
            print("Fehler beim Abrufen der Personendaten. \(error)")
        }
    }

    // Funktion, um ein neues Mitglied zur CoreData-Datenbank hinzuzufügen.
    func addNewMember(_ desc : String){
        let newUser = UserEntity(context: container.viewContext)
        newUser.desc = desc
        newUser.done = false
        saveData()
    }
    
    
    func deleteMemberData(indexSet : IndexSet){
        for index in indexSet{
            let memberData = savedUserDaten[index]
            container.viewContext.delete(memberData)
            saveData()
        }
    }

    // Funktion, um die Daten in der CoreData-Datenbank zu speichern.
    func saveData(){
        do{
            try container.viewContext.save()
            fetchMemberData()
        }catch let error{
            print("Fehler beim Speichern. \(error)")
        }
    }
}
