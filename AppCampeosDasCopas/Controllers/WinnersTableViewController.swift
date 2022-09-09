//
//  WinnersTableViewController.swift
//  AppCampeosDasCopas
//
//  Created by Renato on 07/09/22.
//

import UIKit

class WinnersTableViewController: UITableViewController {
    
    //instanciando WorldCup para popular com o dados do arquivo JSON(carregar todas as info's que contem no arquivo JSON)
    var worldCups: [WorldCup] = []
    
    //passando informações de uma view para outra
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WorldCupViewController //tela que vai apresentar os dados
        //pegar o Index do dados da linha selecionada
        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row]
        vc.worldCup = worldCup
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Carregar os dados da Copa do mundo
        loadWorldCups()
        
    } //end override func viewDidLoad
    
    func loadWorldCups(){
        //carregar todas as copas do mundo, vai tirar do JSON e carregar no ARRAY worldCups
        let fileURL = Bundle.main.url(forResource: "winners.json", withExtension: nil)!
        let jsonData = try! Data(contentsOf: fileURL)
        do { //Tentando decodificar a struct do arquivo WorldCup.swift e jogar dentro da variável worldCups
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
            
        } catch {
            print(error)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //define o numero de agrupamentos, quando há somente 1 agrupamento nao se faz necessário esse metodo ou comenta-se/exclui esse método
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //retorna a quantidade de linhas que deseja mostrar, neste caso, a quantidade de linhas que tem no JSON.
        return worldCups.count
    }

    //metodo que é chamado sempre que for apresentar apresentar uma celula, quando ela estiver preste a ser visualizada
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tenta utilizar uma celular com o identificador informado
        //dequeueReusableCell - ele vai Re Utilizando a informação da celula para que não seja preciso carregar mil informações na memória do celular e dar crash depois.
        //2º passo - tratar a constate cell como uma WorldCupViewCellController, dessa maneira vamos ter acesso a todas as propriedades
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableViewCell

        // Configure the cell...
        //Preenchar cada celula com UITableViewCell
        let worldCup = worldCups[indexPath.row]
//        cell.textLabel?.text = "Copa \(worldCup.year) - \(worldCup.country)"
//        cell.detailTextLabel?.text = "\(worldCup.winner) vs \(worldCup.vice)"
//        cell.imageView?.image = UIImage(named: "\(worldCup.winner).png")
        cell.prepare(with: worldCup)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
