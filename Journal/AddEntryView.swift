//
//  AddEntryView.swift
//  lotusNotes
//
//  Created by Nadia Iskandar on 4/15/23.
//
import SwiftUI
struct AddEntryView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var entry = ""
    @State private var date = Date().formatted()
    
    var body: some View {
        Form {
            Section{
                TextField("Date", text: $date )
                VStack{
                    TextField("New Journal Entry", text: $entry,axis: .vertical )
                }
                .padding()
                HStack(){
                    
                    Spacer()
                    Button("Save"){
                        DataController().addEntry(date: Date(), entry: entry, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                    
                }
            }
            
        }
        
    }
    
    struct AddEntryView_Previews: PreviewProvider {
        static var previews: some View {
            AddEntryView()
        }
    }
}
