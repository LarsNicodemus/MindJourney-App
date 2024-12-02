//
//  FAQView.swift
//  TraumJobs
//
//  Created by Andreas Beer on 29.10.24.
//


import SwiftUI

struct FAQView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Häufig gestellte Fragen (FAQ)")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Text("1. Wie kann ich mich registrieren?")
                .bold()
                .underline()
            Text("\nUm die App nutzen zu können, müssen Sie sich registrieren. Klicken Sie auf der Startseite auf \"Registrieren\" und erstellen Sie ein Konto. Die Registrierung erfolgt sicher über Firebase und speichert Ihre Daten verschlüsselt.\n\n")
            
            Text("2. Wie kann ich meinen Tag dokumentieren?")
                .bold()
                .underline()
            Text("\nSie können ganz einfach einen neuen Eintrag erstellen. Dokumentieren Sie Ihren Tag, indem Sie einen Text verfassen, Bilder hinzufügen, eine Audioaufnahme machen oder Ihren aktuellen Zustand mit einem Mood festhalten.\n\n")
            
            Text("3. Wie funktioniert der Kalender?")
                .bold()
                .underline()
            Text("\nDer integrierte Kalender zeigt Ihnen eine Übersicht aller gespeicherten Einträge. Sie können auf einen Tag tippen, um die Details des jeweiligen Eintrags zu sehen und bei Bedarf zu bearbeiten.\n\n")
            
            Text("4. Kann ich mir meine Audioaufnahmen später anhören?")
                .bold()
                .underline()
            Text("\nJa, Sie können alle gespeicherten Audioaufnahmen jederzeit anhören. Diese sind in den jeweiligen Einträgen gespeichert und leicht zugänglich.\n\n")
            
            Text("5. Wie verwalte ich meine Einträge?")
                .bold()
                .underline()
            Text("\nAlle Einträge werden in einer übersichtlichen Liste angezeigt. Sie können dort nach Einträgen suchen, diese ansehen oder bearbeiten. Wetterdaten des jeweiligen Tages werden automatisch hinzugefügt, um Ihre Erinnerungen noch lebendiger zu gestalten.\n\n")
            
            Text("6. Kann ich meine Daten sichern?")
                .bold()
                .underline()
            Text("\nIhre Daten werden sicher über Firebase gespeichert und sind nur für Sie zugänglich. Eine automatische Synchronisation sorgt dafür, dass Ihre Erinnerungen nicht verloren gehen.\n\n")
            
            Text("7. Wie kann ich Benachrichtigungen einstellen?")
                .bold()
                .underline()
            Text("\nIn den Einstellungen können Sie tägliche Erinnerungen aktivieren, die Sie auffordern, einen neuen Eintrag zu erstellen. Sie können die Uhrzeit der Benachrichtigungen frei wählen.\n\n")
            
            Text("8. Wie funktioniert das Mood-Feature?")
                .bold()
                .underline()
            Text("\nDas Mood-Feature ermöglicht es Ihnen, Ihren aktuellen Zustand schnell und visuell zu dokumentieren. Wählen Sie einfach ein passendes Icon oder eine Stimmung aus, die zu Ihrem Tag passt.\n\n")
            
            Text("9. Wie lösche ich mein Konto?")
                .bold()
                .underline()
            Text("\nFalls Sie Ihr Konto löschen möchten, gehen Sie in den Bereich \"Einstellungen\" und wählen Sie \"Konto löschen\". Bitte beachten Sie, dass dabei alle Ihre Einträge und Daten unwiderruflich gelöscht werden.")
        }
        .padding()
    }
}


#Preview {
    FAQView()
}
