import UIKit

class ListViewController: UIViewController, PokemonManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var tablePokemon = UITableView()
    var pokemonManager = PokemonManager()
    var pokemons: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tablePokemon)
        tablePokemon.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tablePokemon.delegate = self
        tablePokemon.dataSource = self
        tablePokemon.frame = view.bounds
        pokemonManager.delegate = self
        pokemonManager.showPokemon()
    }
    
    func PokemonList(list: [Pokemon]) {
        pokemons = list
        tablePokemon.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pokemons[indexPath.row].name
        cell.textLabel?.textAlignment = .center
        return cell
    }
}
