//
//  JournalView.swift
//  lotusNotes
//
//  Created by Nadia Iskandar on 4/15/23.
//
import SwiftUI
import CoreData
struct JournalView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var journal: FetchedResults<Journal>
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(journal){ journal in
                        
                            NavigationLink(destination: Text("\(journal.entry ?? "date")") ){
                            HStack{
                                VStack(alignment: .leading, spacing: 6){
                                    Text(calcTimeSince(date: journal.date!))
                                    Text(journal.entry!)
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteEntry)
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Journal")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showingAddView.toggle()
                    }label: {
                        Label("Add Entry", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            }
            
            .sheet(isPresented: $showingAddView){
                AddEntryView()
            }
        }
        
        .navigationViewStyle(.stack)
          
    }
    
    private func deleteEntry(offsets: IndexSet){
        withAnimation{
            offsets.map{journal[$0]}.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
            
        }
    } 
}
