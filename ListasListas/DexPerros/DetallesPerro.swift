//
//  DetallesPerro.swift
//  ListasListas
//
//  Created by Rodolfo Castillo on 08/02/24.
//

import Foundation
import SwiftUI

// Vista que muestra la información de Pomela
struct DogView: View {
    @ObservedObject var controller: DogController
    
    var body: some View {
        VStack {
            Spacer()
            Text("Nombre: \(controller.dog.name)")
                .padding()
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .background(.green)
                .cornerRadius(10)
            Spacer()
            Image("\(controller.dog.name)")
                .resizable()
                .scaledToFill()
                .frame(width: 290, height: 290)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 6))
            Spacer()
            Text("Edad: \(controller.dog.age) años")
                .font(.title)
                .fontWeight(.regular)
            Text("\(controller.dog.details)")
                    .font(.title2)
                    .fontWeight(.regular)
                    .italic()
            Spacer()
            Text("Dueño: \(controller.dog.owner)")
                .font(.body)
                .fontWeight(.light)
            Spacer()
        }
        .padding()
        .navigationTitle("\(controller.dog.name)")
    }
}

// Controlador que maneja la información del modelo de Pomela
class DogController: ObservableObject {
    @Published var dog: Perro
    
    init(dog: Perro) {
        self.dog = dog
    }
    
    // Aquí puedes agregar métodos para actualizar los datos de Pomela si es necesario
}

struct DetallesPerros_Preview: PreviewProvider {
    static var previews: some View {
        let pomela = Perro(name: "Pomelo)", owner: "Aimecita", age: 6, details: "Miedosa")
        let controller = DogController(dog: pomela)
        
        // Pasamos el controlador a la vista
        DogView(controller: controller)
    }
}
