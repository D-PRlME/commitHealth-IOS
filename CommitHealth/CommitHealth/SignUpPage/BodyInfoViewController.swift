import UIKit
import SnapKit
import Then

class BodyInfoViewController: UIViewController {
    
    var userWeight: Int = 30
    var userHeight: Int = 100
    
    let titleLabel = UILabel().then {
        $0.text = "신체 프로필\n입력을 시작할게요"
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.numberOfLines = 2
    }
    
    let bodyInfoPickerView = UIPickerView()
    
    let weightKRLable = UILabel().then {
        $0.text = "체중"
        $0.textColor = UIColor(named: "Gray-5")
        $0.backgroundColor = .clear
        $0.font = UIFont(name: "Pretendard-Bold", size: 20)
    }
    
    let weightUSLable = UILabel().then {
        $0.text = "Kg"
        $0.textColor = UIColor(named: "Gray-5")
        $0.backgroundColor = .clear
        $0.font = UIFont(name: "Pretendard-Regular", size: 20)
    }
    
    let heightKRLable = UILabel().then {
        $0.text = "키"
        $0.textColor = UIColor(named: "Gray-5")
        $0.backgroundColor = .clear
        $0.font = UIFont(name: "Pretendard-Bold", size: 20)
    }
    
    let heightUSLable = UILabel().then {
        $0.text = "Cm"
        $0.textColor = UIColor(named: "Gray-5")
        $0.backgroundColor = .clear
        $0.font = UIFont(name: "Pretendard-Regular", size: 20)
    }
    
    let skipButton = UIButton().then {
        $0.setTitle("나중에 할게요", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-6"), for: .normal)
    }
    
    let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-9"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
        $0.backgroundColor = UIColor(named: "Green-5")
        $0.layer.cornerRadius = 6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        skipButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonClick), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
        bodyInfoPickerView.delegate = self
        bodyInfoPickerView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        startSetting()
    }
    
    func startSetting() {
        [titleLabel, skipButton, nextButton, bodyInfoPickerView, weightKRLable, weightUSLable, heightKRLable, heightUSLable].forEach({self.view.addSubview($0)})
        
        titleLabel.snp.makeConstraints {
            $0.leftMargin.equalToSuperview().offset(20)
            $0.topMargin.equalToSuperview().offset(70)
        }
        
        skipButton.snp.makeConstraints {
            $0.bottom.equalTo(nextButton.snp.top).offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
        
        bodyInfoPickerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(100)
        }
        
        weightKRLable.snp.makeConstraints {
            $0.bottom.equalTo(bodyInfoPickerView.snp.top)
            $0.centerX.equalTo(bodyInfoPickerView.snp.centerX).offset(-65)
        }
        
        heightKRLable.snp.makeConstraints {
            $0.bottom.equalTo(bodyInfoPickerView.snp.top)
            $0.centerX.equalTo(bodyInfoPickerView.snp.centerX).offset(65)
        }
        
        weightUSLable.snp.makeConstraints {
            $0.top.equalTo(bodyInfoPickerView.snp.bottom)
            $0.centerX.equalTo(bodyInfoPickerView.snp.centerX).offset(-65)
        }
        
        heightUSLable.snp.makeConstraints {
            $0.top.equalTo(bodyInfoPickerView.snp.bottom)
            $0.centerX.equalTo(bodyInfoPickerView.snp.centerX).offset(65)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(348)
            $0.height.equalTo(65)
        }
    }
    
    @objc func skipButtonClick() {
        navigationController?.pushViewController(EndSignUpViewController(), animated: true)
    }
    
    @objc func  nextButtonClick() {
        print("몸무게: ", userWeight, "Kg")
        print("키: ", userHeight, "Cm")
        navigationController?.pushViewController(ThreeBodyInfoViewController(), animated: true)
    }
}

extension BodyInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 121
        } else {
            return 151
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(row + 30)"
        } else {
            return "\(row + 100)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 53
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickLabel = UILabel()
        pickLabel.textColor = .black
        pickLabel.font = UIFont(name: "Pretendard-Bold", size: 40)
        if component == 0 {
            pickLabel.text = "\(row + 30)"
        } else {
            pickLabel.text = "\(row + 100)"
        }
        pickLabel.textAlignment = .center
        return pickLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            userWeight = row + 30
        } else {
            userHeight = row + 100
        }
    }
}
