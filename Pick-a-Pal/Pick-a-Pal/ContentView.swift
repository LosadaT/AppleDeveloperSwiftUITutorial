//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Francisco Totaro on 20/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8){
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            //Se não tiver nenhum nome na lista, devolva vazio, caso contrario, mostre o nome
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            List{
                ForEach(names, id: \.description){ name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                //Quando enviar
                .onSubmit {
                    if !nameToAdd.isEmpty{
                        //Caso o nome já esteja na lista, nao adiciona nada
                        if names.contains(nameToAdd){
                            nameToAdd = ""
                        }
                        else{
                            names.append(nameToAdd)
                            nameToAdd = ""
                        }
                        
                    }
                }
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            Button{
                if let randomName = names.randomElement(){
                    pickedName = randomName
                    
                    if shouldRemovePickedName{
                        //Esvazia uma lista
                        names.removeAll{ name in
                            return (name == randomName)
                        }
                    }
                }
                else{
                    pickedName = ""
                }
            }label:{
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
