//
//  PayButtonView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI
import PassKit

// Diese Ansicht repräsentiert einen Pay-Button
struct PayButtonView: View {
    var action : () -> Void
    var body: some View {
        // Verwende die Representable-Struktur, um den PKPaymentButton darzustellen
        Representable(action: action)
            .frame(minWidth: 100, maxWidth: 400)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
    }
}

// Eine Vorschau der PayButtonView
struct PayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PayButtonView(action: {})
    }
}

// Erweiterung der PayButtonView, um die UIView in SwiftUI darzustellen
extension PayButtonView {
    struct Representable : UIViewRepresentable {
        var action: () -> Void
        
        // Erstellen des Coordinators
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        
        // Erstellen des PKPaymentButton
        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }
        
        // Aktualisieren des PKPaymentButton
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
        
        // Ein Coordinator führt die vom Benutzer angegebene Aktion aus
        class Coordinator : NSObject {
            var action : () -> Void
            var button = PKPaymentButton(paymentButtonType: .book, paymentButtonStyle: .automatic)
            
            init(action: @escaping () -> Void) {
                self.action = action
                super.init()
                
                // Füge den Handler zum Ausführen der vom Benutzer angegebenen Aktion hinzu
                button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
            }
            
            // Der Handler, der aufgerufen wird, wenn der Benutzer den Pay-Button drückt
            @objc func callback(_ sender: Any){
                action()
            }
        }
    }
}
