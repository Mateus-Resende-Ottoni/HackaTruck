//
//  ViewModel.swift
//  DesafioHacka10
//
//  Created by Mateus Ottoni on 27/03/25.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var personagens: [SDV] = []
    
    func fetch() {
        // Acesso à API
        guard let url = URL(string: "http://127.0.0.1:1880/leituraMateus")
                        else { return } // Retornar vazio se a URL não for válida
        
        // Variável para buscar os dados da URL
        let task = URLSession.shared.dataTask(with: url) {
            [weak self] data, _, error in
            
            // Para evitar vazamento de memória
            guard let data = data, error == nil else {
                return
            }
            
            // Parsing
            do {
                let parsed = try JSONDecoder().decode([SDV].self, from: data)
                
                DispatchQueue.main.async {
                    self?.personagens = parsed
                }
                
            } catch {
                // Print do erro em caso de falha
                print(error)
            }
            
        } // Fim task
        task.resume()
        
        
        
    } // Fim func fetch()
    
    func organize() {
        
        // Para organizar
        self.personagens.sort { (personagem1, personagem2) -> Bool in
            return personagem1.name < personagem2.name
        }
        
    }
    
    
    
} // Fim class ViewModel
