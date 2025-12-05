

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet private weak var heroCover: UIImageView!
    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var raceLabel: UILabel!
    @IBOutlet private weak var placeOfBirthLabel: UILabel!
    @IBOutlet private weak var publisherLabel: UILabel!

    @IBOutlet private weak var intelligenceLabel: UILabel!
    @IBOutlet private weak var strengthLabel: UILabel!
    @IBOutlet private weak var speedLabel: UILabel!
    @IBOutlet private weak var durabilityLabel: UILabel!
    @IBOutlet private weak var powerLabel: UILabel!
    @IBOutlet private weak var combatLabel: UILabel!


    private let service = HeroServiceModern()


    override func viewDidLoad() {
        super.viewDidLoad()

        clearUI()
    }


    @IBAction private func randomButtonTapped(_ sender: UIButton) {
        loadRandomHero()
    }
    @IBAction private func getHeroes() {
        }


    private func loadRandomHero() {
        nameLabel.text = "Loading..."

        Task { @MainActor in
            do {
                let hero = try await service.fetchHero()
                updateUI(with: hero)
            } catch {
                showError(message: "Не удалось загрузить героя. Попробуйте ещё раз.")
                clearUI()
                print("Network error: \(error)")
            }
        }
    }


    private func updateUI(with hero: HeroModel) {
        nameLabel.text = hero.name
        fullNameLabel.text = "Full name: \(hero.biography.fullName)"
        genderLabel.text = "Gender: \(hero.appearance.gender)"
        raceLabel.text = "Race: \(hero.appearance.race ?? "-")"
        placeOfBirthLabel.text = "Birth: \(hero.biography.placeOfBirth)"
        publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "-")"

        intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
        strengthLabel.text = "Strength: \(hero.powerstats.strength)"
        speedLabel.text = "Speed: \(hero.powerstats.speed)"
        durabilityLabel.text = "Durability: \(hero.powerstats.durability)"
        powerLabel.text = "Power: \(hero.powerstats.power)"
        combatLabel.text = "Combat: \(hero.powerstats.combat)"

        if let url = URL(string: hero.images.md) {
            heroImageView.kf.setImage(with: url)
        } else {
            heroImageView.image = nil
        }
    }

    private func clearUI() {
        heroImageView.image = nil

        nameLabel.text = ""
        fullNameLabel.text = ""
        genderLabel.text = ""
        raceLabel.text = ""
        placeOfBirthLabel.text = ""
        publisherLabel.text = ""

        intelligenceLabel.text = ""
        strengthLabel.text = ""
        speedLabel.text = ""
        durabilityLabel.text = ""
        powerLabel.text = ""
        combatLabel.text = ""
    }

    private func showError(message: String) {
        let alert = UIAlertController(title: "Ошибка",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default))
        present(alert, animated: true)
    }
}
