//
//  SimpleTextEditorSwiftUI_2_0App.swift
//  SimpleTextEditorSwiftUI 2.0
//
//  Created by Yurii Sameliuk on 05/03/2021.
//

import SwiftUI

@main
struct SimpleTextEditorSwiftUI_2_0App: App {
    var body: some Scene {
        DocumentGroup(newDocument: TextFile()) { file in
            Documents(document: file.$document)
        }
    }
}
