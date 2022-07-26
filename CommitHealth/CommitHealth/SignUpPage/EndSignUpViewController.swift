import UIKit
import SnapKit
import Then

class EndSignUpViewController: UIViewController {

    let titleLabel = UILabel().then {
        $0.text = "이제 시작해 볼까요?"
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.numberOfLines = 2
    }
    
    let startButton = UIButton().then {
        $0.setTitle("시작하기", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-9"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
        $0.backgroundColor = UIColor(named: "Green-5")
        $0.layer.cornerRadius = 6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        startButton.addTarget(self, action: #selector(signUpEndButtonClick), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLayoutSubviews() {
        startSetting()
    }
    
    func startSetting() {
        [titleLabel, startButton].forEach({self.view.addSubview($0)})
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        startButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(348)
            $0.height.equalTo(65)
        }
        
    }
    
    @objc func signUpEndButtonClick() {
        print("go to main page")
    }
}
