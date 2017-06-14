//
//  ProcessCollectionViewCell.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 07/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class ProcessCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    private var page = 0
    private var texts = [
                         ("1 - Cadastro", "O candidato à doação informa seus dados e recebe um código que o acompanha durante todo o processo da doação.\nO atendente confere com o doador se estão corretos os dados, como endereço, telefone, e-mail e CEP."),
                         
                         ("2 - Teste de Anemia", "Esse exame é feito para verificar se o candidato à doação possui nível de hemoglobina \"dentro dos parâmetros de normalidade\". Caso esteja abaixo ou acima dos valores normais, o candidato é orientado a procurar o serviço de saúde. Pessoas com anemia não podem doar."),
                         
                         ("3 - Sinais Vitais e peso", "São verificados o batimento cardíaco, pressão arterial, peso e temperatura do candidato."),
                         
                         ("4 - Triagem Clínica", "O candidato responde a uma entrevista confidencial, com o objetivo de avaliar se a doação pode trazer riscos para ele ou para o receptor. É fundamental responder corretamente e honestamente às perguntas."),
                         
                         ("5 - Voto de autoexclusão", "O doador faz uma opção confidencial respondendo SIM ou NÃO à seguinte pergunta: \"Você apresenta situação de risco para doenças sexualmente transmissííveis\"? Independentemente da resposta, o sangue será coletado, e todos os testes serão realizados. Porém, se a resposta for SIM, independentemente do resultado desses exames, a bolsa será descartada."),
                         
                         ("6 - Coleta", "É passada uma solução antisséptica no local onde será feita a punção. A coleta de sangue é totalmente segura, sendo utilizada uma agulha estéril, de uso único e descartável, para coletar cerca de 450ml de sangue e amostras para a realização de exames obrigatórios por lei."),
                         
                         ("7 - Lanchinho :)", "Após a doação, o doador recebe um lanche e um suco, que deverão ser consumidos na Cantina do posto de coleta.\nAlgumas orientações pós-doação:\n - manter o curativo no local por pelo menos 4 horas;\n - não ingerir bebidas alcoólicas;\n - evitar esforço físico; e\n - beber bastante líquido."),
                         
                         ("8 - O caminho da bolsa até a transfusão", "O sangue doado é testado para hepatite B e C, HIV, HTLV I e II, Chagas e sífilis. Se um destes testes apresentar resultado alterado, o sangue doado não será utilizado para transfusão e o doador será convocado a retornar à Fundação Pró-Sangue para repetição dos exames.\nCaso ocorra inadequação das amostras, o doador também será convocado a repetir os exames.")]
    
    public func setPage(_ n: Int) {
        if n <= 0 {
            //change texts
            self.page = 0
            self.title.text = texts[self.page].0
            self.text.text = texts[self.page].1
            
            //disable button
            self.previousButton.isEnabled = false
            
        } else if n >= texts.count - 1 {
            //change texts
            self.page = texts.count - 1
            self.title.text = texts[self.page].0
            self.text.text = texts[self.page].1
            
            //disable button
            self.nextButton.isEnabled = false
            
        } else {
            //change texts
            self.page = n
            self.title.text = texts[self.page].0
            self.text.text = texts[self.page].1
            
            //enable both buttons
            self.previousButton.isEnabled = true
            self.nextButton.isEnabled = true
        }
    }
    
    public func reset() {
        self.setPage(0)
    }
    
    @IBAction func previousPage(_ sender: Any) {
        setPage(self.page - 1)
    }
    
    @IBAction func nextPage(_ sender: Any) {
        setPage(self.page + 1)
    }
}
