import UIKit

class ViewController: UIViewController {
    
    var number = 0
    var score = 0
    var maxScore = 0
    var rate = 1
    var numberOfRightAnswers = 0
    let gradientLayer = CAGradientLayer()

    let scoreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconMoneyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "money_icon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let maxScoreView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
        view.layer.cornerRadius = 22
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconLithingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lighting_icon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let maxScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FredokaOne-Regular", size: 320)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rateView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8196078431, blue: 0.4, alpha: 1)
        view.layer.cornerRadius = 44
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
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
        button.backgroundColor = .black

        
        var buttonConfiguration = UIButton.Configuration.plain()
        if let arrowImage = UIImage(named: "down_icon") {
            buttonConfiguration.image = arrowImage
        }
        
        buttonConfiguration.imagePadding = 10.0
        button.configuration = buttonConfiguration
        
        button.layer.cornerRadius = 8
        button.tintColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(lessButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Больше", for: .normal)
        button.backgroundColor = .black

        
        var buttonConfiguration = UIButton.Configuration.plain()
        if let arrowImage = UIImage(named: "up_icon") {
            buttonConfiguration.image = arrowImage
        }
        
        buttonConfiguration.imagePadding = 10.0
        button.configuration = buttonConfiguration
        
        button.layer.cornerRadius = 8
        button.tintColor = .white

        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        generateRandomNumber()
        setupUI()
        rateLabel.text = "\(rate)"
        scoreLabel.text = "\(score)"
        maxScoreLabel.text = "\(maxScore)"
    }
    
    func setupUI() {
        gradientLayer.frame = view.bounds

        
        gradientLayer.locations = [0, 0.71]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.colors = [
            UIColor(red: 0.352, green: 0.729, blue: 0.481, alpha: 1).cgColor,
            UIColor(red: 0.443, green: 0.871, blue: 0.537, alpha: 0).cgColor
            ]

        view.layer.insertSublayer(gradientLayer, at: 0)
        
        numberLabel.textColor = #colorLiteral(red: 0.4291720092, green: 0.7116048336, blue: 0.4111719728, alpha: 1)
        
        view.addSubview(scoreView)
        scoreView.addSubview(iconMoneyImageView)
        scoreView.addSubview(scoreLabel)
        
        view.addSubview(maxScoreView)
        maxScoreView.addSubview(iconLithingImageView)
        maxScoreView.addSubview(maxScoreLabel)

        
        view.addSubview(numberLabel)
        view.addSubview(rateView)
        
        rateView.addSubview(rateLabel)
        
        view.addSubview(nextLabel)
        
        view.addSubview(lessButton)
        view.addSubview(moreButton)
        
        
        NSLayoutConstraint.activate([
            scoreView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            scoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            iconMoneyImageView.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: iconMoneyImageView.trailingAnchor, constant: 4),
            scoreLabel.centerYAnchor.constraint(equalTo: iconMoneyImageView.centerYAnchor),
            
            maxScoreView.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
            maxScoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            maxScoreView.heightAnchor.constraint(equalToConstant: 40),
            
            iconLithingImageView.centerYAnchor.constraint(equalTo: maxScoreView.centerYAnchor),
            iconLithingImageView.leadingAnchor.constraint(equalTo: maxScoreView.leadingAnchor, constant: 16),
            maxScoreLabel.centerYAnchor.constraint(equalTo: iconLithingImageView.centerYAnchor),
            maxScoreLabel.leadingAnchor.constraint(equalTo: iconLithingImageView.trailingAnchor, constant: 4),
            maxScoreLabel.trailingAnchor.constraint(equalTo: maxScoreView.trailingAnchor, constant: -16),
            
            numberLabel.topAnchor.constraint(equalTo: scoreView.bottomAnchor, constant: 40),
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            rateView.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 8),
            rateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rateView.heightAnchor.constraint(equalToConstant: 88),
            rateView.widthAnchor.constraint(equalToConstant: 88),
            
            rateLabel.centerXAnchor.constraint(equalTo: rateView.centerXAnchor),
            rateLabel.centerYAnchor.constraint(equalTo: rateView.centerYAnchor),

            nextLabel.bottomAnchor.constraint(equalTo: lessButton.topAnchor, constant: -24),
            nextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lessButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28),
            lessButton.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor),
            lessButton.heightAnchor.constraint(equalToConstant: 54),
            
            moreButton.bottomAnchor.constraint(equalTo: lessButton.bottomAnchor),
            moreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            moreButton.heightAnchor.constraint(equalToConstant: 54),
            moreButton.widthAnchor.constraint(equalTo: lessButton.widthAnchor),
            moreButton.leadingAnchor.constraint(equalTo: lessButton.trailingAnchor, constant: 24)


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
            setRightAnswerUI()

        } else {
            numberOfRightAnswers = 0
//            updateScore()
            rate = 1
            score = 0
            updateRateLabel()
            updateScoreLabel()
            setWrongAnswerUI()
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
                setRightAnswerUI()


            } else {
                numberOfRightAnswers = 0
//                updateScore()
                rate = 1
                score = 0

                updateRateLabel()
                updateScoreLabel()
                setWrongAnswerUI()

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
        rateLabel.text = "\(rate)"
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
    }
    
    func setRightAnswerUI() {

        gradientLayer.colors = [
            UIColor(red: 0.352, green: 0.729, blue: 0.481, alpha: 1).cgColor,
            UIColor(red: 0.443, green: 0.871, blue: 0.537, alpha: 0).cgColor
            ]
        
        
        numberLabel.textColor = #colorLiteral(red: 0.4291720092, green: 0.7116048336, blue: 0.4111719728, alpha: 1)
    }
    
    func setWrongAnswerUI() {
        gradientLayer.colors = [
            UIColor(red: 0.9, green: 0.554, blue: 0.36, alpha: 1).cgColor,
            UIColor(red: 0.908, green: 0.659, blue: 0.519, alpha: 0).cgColor
            ]
        
        
        numberLabel.textColor = #colorLiteral(red: 0.9098039216, green: 0.4156862745, blue: 0.3058823529, alpha: 1)
    }
}
    

