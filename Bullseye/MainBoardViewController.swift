//
//  ViewController.swift
//  Bullseye
//
//  Created by Tomiris Negmatova on 27/03/22.
//

import UIKit

class MainBoardViewController: UIViewController {

    //@IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameround: UILabel!
    
    // Число, которое пользователь должен угадать.
    var guessingNumber: Int = Int.random(in: 1...100)
    
    // Количество очков игрока.
    var score: Int = 0
    
    // Начальный раунд.
    var round: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalThumbImage = UIImage(named:"SliderThumb-Normal")
        let highlightedThumbImage = UIImage(named:"SliderThumb-Highlighted")
        
        slider.setThumbImage(normalThumbImage, for: .normal)
        slider.setThumbImage(highlightedThumbImage, for: .highlighted)
        
        setUp()
        
    }


    @IBAction func didTapSelectButton(_ sender: Any) {
        
        
        // 1. Забрать число у слайдера.
        let sliderValue: Float = slider.value

        // 2. Перевести это число в Int (sliderValueInt), чтобы можно было сравнить два целых числа.
        let sliderValueInt: Int = Int(slider.value)

        // 3. Сравнить два числа, и если они совпадают, то вывести в консоль информацию об этом.
        let isValuesEquals = sliderValueInt == guessingNumber

        if isValuesEquals {

            // - добавлять 1 очко.
            score += 1

            // - обновить значение лейбла с очками.
            scoreLabel.text = "Очки:" + " " + String(score)

            print("Вы угадали число!")

        }else{

            print("Вы выбрали число \(sliderValueInt)")
        }

        // - Повышать раунд.
        round += 1

        // - обновить значение лейбла с раундом.
        gameround.text = "Раунд " + String(round)

        updateGuessingNumber()

        // -  После окончания 10 раунда, выводить на экран Alert с результатами.
        if round == 11{
            
            gameround.text = "Раунд 10" 
            showResults()
        }
    }
    
    @IBAction func didTapTryAgainButton(_ sender: Any) {
     
        setUp()
    }
    
    func setUp() {
        
        // Настройка начала игры.
        // 1. Устаеавливаем значение слайдера на 50.
        slider.value = 50
        
        
        // 2. Установить число, которое нужно угадать.
        updateGuessingNumber()
        
        // 3. Обнулить очки.
        score = 0
        scoreLabel.text = "Очки:" + " " + String(score)
        
        // Установить значение раунда на лейбле.
        round = 1
        gameround.text = "Раунд " + String(round)
        
    }
    
    // - функция для объявления нового значения числа.
    func updateGuessingNumber(){
        
        guessingNumber = Int.random(in: 1...100)
        
        taskLabel.text = "Попробуйте угадать число:" + " " + String(guessingNumber)
    }
    // - Функция для объявления результатов.
    func showResults(){
        
        // Создаем Alert.
        let alert = UIAlertController(title: "Итоги игры", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        
        // Создали кнопку для Alert.
        let okButton: UIAlertAction = UIAlertAction(title: "Начать сначала", style: .default, handler: { _ in
            print("на меня нажали")
            
            self.setUp()
        })
        
        // Добавили кнопку в Alert.
        alert.addAction(okButton)
        
        // Отобразили  Alert на экране.
        present(alert, animated: true)
    }
}


