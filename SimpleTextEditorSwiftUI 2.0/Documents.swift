//
//  Documents.swift
//  SimpleTextEditorSwiftUI 2.0
//
//  Created by Yurii Sameliuk on 07/03/2021.
//

import SwiftUI
import UniformTypeIdentifiers

struct Documents: View {
    @Binding var document: TextFile
    @State private var tapp = false
    
    var body: some View {
        ZStack {
            VStack() {
                TextEditor(text: $document.text)
                    .frame(maxWidth: .infinity)
                    .frame(height: tapp ? 330 : UIScreen.main.bounds.height)
                    .foregroundColor(.black)
                    .background(Color(#colorLiteral(red: 0.9559392333, green: 0.9502562881, blue: 0.9603074193, alpha: 1)))
                    .zIndex(2)
                
                Spacer()
            }
            .background(Color(#colorLiteral(red: 0.7856134772, green: 0.8419756293, blue: 0.9575102925, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Redactor")
            .navigationBarItems(trailing: Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    tapp.toggle()
                }
                
            }) {
                Text("Edit")
            })
            
            
            if tapp {
                EditorMenuView()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                   .zIndex(1)
            }
        }
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
    }
}

struct TextFile: FileDocument {
    // tell the system we support only plain text
    static var readableContentTypes = [UTType.plainText]
    
    // by default our document is empty
    var text = ""
    
    // a simple initializer that creates new, empty documents
    init(initialText: String = "") {
        text = initialText
    }
    
    // this initializer loads data that has been saved previously
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }
    
    // this will be called when the system wants to write our data to disk
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}


struct Documents_Previews: PreviewProvider {
    static var previews: some View {
        Documents(document: .constant(TextFile()))
    }
}
