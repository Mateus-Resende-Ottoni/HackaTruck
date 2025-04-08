//
//  ViewModelText.swift
//  Presentations
//
//  Created by Mateus Ottoni on 04/04/25.
//

import Foundation

class ViewModelText : ObservableObject {
    
    @Published var transcricoes : [Transcription] = []
    
    func fetch() {
        // Acesso à API
        guard let url = URL(string: "http://192.168.128.9:1880/leituraPresentationsText")
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
                let parsed = try JSONDecoder().decode([Transcription].self, from: data)
                
                DispatchQueue.main.async {
                    self?.transcricoes = parsed
                }
            } catch {
                // Print do erro em caso de falha
                print(error)
            }
            
        } // Fim task
        task.resume()
        
        
        
    } // Fim func fetch()
    
    
} // Fim class ViewModelPresentation
