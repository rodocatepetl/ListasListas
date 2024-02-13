//
//  DietDex.swift
//  ListasListas
//
//  Created by Gabriela Aimee Salazar Mata on 08/02/24.
//

import SwiftUI

struct Ingrediente: Hashable {
    
    let name: String
    let quantity: Int
    let shop: String
    
    static func == (lhs: Ingrediente, rhs: Ingrediente) -> Bool {
        return lhs.name == rhs.name && lhs.quantity == rhs.quantity && lhs.shop == rhs.shop
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(quantity)
        hasher.combine(shop)
    }
}

struct DietPreView: View {
    
    @State private var toggleStates: [Ingrediente: Bool] = [:]
        
    let Ingredientes: [Ingrediente] = [
        Ingrediente(name: "Salmón", quantity: 850, shop: "CityMarket"),
        Ingrediente(name: "Bistec de res", quantity: 450, shop: "CityMarket"),
        Ingrediente(name: "Filete de res", quantity: 450, shop: "CityMarket"),
        Ingrediente(name: "Molida de res", quantity: 250, shop: "CityMarket"),
        Ingrediente(name: "Pechuga de pavo", quantity: 1150, shop: "CityMarket"),
        Ingrediente(name: "Tofu", quantity: 400, shop: "CityMarket"),
        Ingrediente(name: "Lentejas", quantity: 600, shop: "Mercado"),
        Ingrediente(name: "Garbanzos", quantity: 400, shop: "Mercado"),
        Ingrediente(name: "Aguacate", quantity: 2000, shop: "Walmart"),
        Ingrediente(name: "Tortilla", quantity: 1000, shop: "Walmart"),
        Ingrediente(name: "Leche light", quantity: 5000, shop: "Walmart"),
        Ingrediente(name: "Batatas", quantity: 450, shop: "Walmart"),
        Ingrediente(name: "Papas moradas", quantity: 750, shop: "Walmart"),
        Ingrediente(name: "Yuca", quantity: 150, shop: "Walmart"),
        Ingrediente(name: "Quinoa", quantity: 600, shop: "Mercado"),
        Ingrediente(name: "Espinacas", quantity: 450, shop: "Walmart"),
        Ingrediente(name: "Brócoli", quantity: 200, shop: "Walmart"),
        Ingrediente(name: "Zanahoria", quantity: 210, shop: "Walmart"),
        Ingrediente(name: "Espárragos", quantity: 200, shop: "Walmart"),
        Ingrediente(name: "Lechuga", quantity: 700, shop: "Walmart"),
        Ingrediente(name: "Pepino", quantity: 700, shop: "Walmart"),
        Ingrediente(name: "Jitomate", quantity: 850, shop: "Walmart")
    ]
    
    var body: some View {
        NavigationView {
            VStack (spacing: 12) {
                Text("Lista de súper")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 4.0)
                    .foregroundColor(.blue)
                HStack {
                    Text ("Ingredientes")
                        .font(.headline)
                }
                
                getList()
                // Aquí puedes mostrar un ejemplo más avanzado, como una lista con elementos personalizados,
                // interacción con los datos, etc. Asegúrate de que sea un ejemplo que se pueda probar en un Playground.
                
                // Ejemplo de lista con datos dinámicos y vistas personalizadas
            }
        }
    }

    
    func getList() -> some View {
        List(self.Ingredientes, id: \.self) { ingrediente in
            HStack {
                NavigationLink {
                    let controller = DietController (ingredient: ingrediente)
                    
                    // Pasamos el controlador a la vista
                    DietView(controller: controller)
                } label: {
                    Text(ingrediente.name)
                }
            
                    Toggle("", isOn: bindingForIngredient(ingrediente))
                }
            }
        }
    
    private func bindingForIngredient(_ ingredient: Ingrediente) -> Binding<Bool> {
            // Si no existe un estado para este ingrediente, lo inicializamos como falso
            if toggleStates[ingredient] == nil {
                toggleStates[ingredient] = false
            }
            
            return Binding<Bool>(
                get: { toggleStates[ingredient] ?? false },
                set: { toggleStates[ingredient] = $0 }
            )
        }
    }
