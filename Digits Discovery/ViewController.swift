import UIKit

class ViewController: UIViewController {
    
    var number = 0
    var score = 0
    var maxScore = 0
    var rate = 1
    var numberOfRightAnswers = 0
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let maxScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 280)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "Следующее число"
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lessButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Меньше", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(lessButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Больше", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        generateRandomNumber()
        setupUI()
        rateLabel.text = "Ставка: \(rate)"

    }
    
    func setupUI() {
        view.addSubview(scoreLabel)
        view.addSubview(maxScoreLabel)

        view.addSubview(numberLabel)
        view.addSubview(nextLabel)
        
        view.addSubview(lessButton)
        view.addSubview(moreButton)
        
        view.addSubview(rateLabel)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            maxScoreLabel.topAnchor.constraint(equalTo: scoreLabel.topAnchor),
            maxScoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            numberLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 40),
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 40),
            nextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lessButton.topAnchor.constraint(equalTo: nextLabel.bottomAnchor, constant: 20),
            lessButton.leadingAnchor.constraint(equalTo: scoreLabel.leadingAnchor),
            
            moreButton.topAnchor.constraint(equalTo: lessButton.topAnchor),
            moreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            rateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rateLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        
        
        
    }
    
    @objc func lessButtonTapped() {
        var newNumber = number
        
        while newNumber == number {
            newNumber = Int.random(in: 1...9)
        }
        
        if newNumber < number {
            numberOfRightAnswers += 1
            updateScore()
            updateRateLabel()

        } else {
            numberOfRightAnswers = 0
//            updateScore()
            rate = 1
            score = 0
            updateRateLabel()
            updateScoreLabel()


        }
        
        number = newNumber
        numberLabel.text = "\(number)"
    }
        
    @objc func moreButtonTapped() {
            var newNumber = number
            
            while newNumber == number {
                newNumber = Int.random(in: 1...9)
            }
            
            if newNumber > number {
                numberOfRightAnswers += 1
                updateScore()
                updateRateLabel()


            } else {
                numberOfRightAnswers = 0
//                updateScore()
                rate = 1
                score = 0

                updateRateLabel()
                updateScoreLabel()


            }
            
            number = newNumber
            numberLabel.text = "\(number)"
        
    }
        
        func generateRandomNumber() {
            let newNumber = number
            
            while newNumber == number {
                number = Int.random(in: 1...9)
            }
            numberLabel.text = "\(number)"
        }
    
    func updateScore() {

        if numberOfRightAnswers >= 9 {
            rate = 8
        } else if numberOfRightAnswers >= 6 {
            rate = 5
        } else if numberOfRightAnswers >= 3 {
            rate = 3
        } else {
            rate = 1
        }
        
        score += rate
        
        updateRateLabel()

        
        if maxScore < score {
            maxScore = score
        }
        
        scoreLabel.text = "\(score)"
        maxScoreLabel.text = "\(maxScore)"
        

    }
    
    func updateRateLabel() {
        rateLabel.text = "Ставка: \(rate)"
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
    }
    
}
    

