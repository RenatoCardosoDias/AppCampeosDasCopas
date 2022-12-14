//
//  WorldCupViewController.swift
//  AppCampeosDasCopas
//
//  Created by Renato on 07/09/22.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    //usando o Delegate, e para que a classe possa responde a alguns metodos que são disparados quando manipula a tabela quando o usuário por exemmplo quer excluir algum item, quando ele seleciona uma celula, coisas que envolve a manipulação pelo o usuário dessa tabela são disparados usando o delegate
    
    
    //DataSource - é o protocolo que define os metodos que vão servir para alimentar a minha tabela
    
    
    //Recebendo dados da view WinnersTableViewController
    var worldCup : WorldCup!

    override func viewDidLoad() {
        super.viewDidLoad()

        //testando se foi pego o index
        //print("ano da compa selecionada: \(worldCup.year)")
        //alterando o navigationItem da view
        title = "WorldCup \(worldCup.year)"
        
        
        ivWinner.image = UIImage(named: "\(worldCup.winner).png")
        ivVice.image = UIImage(named: "\(worldCup.vice).png")
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
        lbScore.text = "\(worldCup.winnerScore) X \(worldCup.viceScore)"
        
    } //end override func viewDidLoad
    

}//end class WorldCupviewController


extension WorldCupViewController: UITableViewDataSource {
    //definindo o numero de secções da tabela
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //DICA: QUANDO TEMMOS SOMENTE UMA SEÇÃO NÃO PRECISAMOS DEFINIR O METODO, no caso desse aplicativos vamos definir de acordo com a fase que cada time passa
        return worldCup.matches.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //DEFINIR A QUANTIDADE DE LINHAS DE CADA SEÇÃO
        //mostar a lista de todos
        //criar um array que armazena a quantidade de jogos de cada fase, pois alguns tem 2 fases outras 4 e assim por diante, vamos definir o numero de linhas através do numero armazendo no array
        
        let games = worldCup.matches[section].games
        return games.count
    }
    //metodo para perpara a celeula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        return cell
    }
    
} //end extension WorldCupViewController

extension WorldCupViewController: UITableViewDelegate {
    
}
