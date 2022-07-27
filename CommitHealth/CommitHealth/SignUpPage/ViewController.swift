import UIKit
import SnapKit
import Then
import Alamofire

class ViewController: UIViewController {
    //MARK: - 개체설정
    let pageControl = UIPageControl().then {
        $0.numberOfPages = 4
        $0.backgroundColor = .clear
        $0.currentPageIndicatorTintColor = UIColor(named: "Gray-8") //페이지 선택했을때 색
        $0.pageIndicatorTintColor = UIColor(named: "Gray-4") //페이지 선택 안했을때 색
    }
    
    let pageScrollView = UIScrollView().then {
        $0.backgroundColor = .clear
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    let contentView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let page1 = UIView().then {
        $0.backgroundColor = .white
    }
    let page2 = UIView().then {
        $0.backgroundColor = .white
    }
    let page3 = UIView().then {
        $0.backgroundColor = .white
    }
    let page4 = UIView().then {
        $0.backgroundColor = .white
    }
    
    let page2TitleLabel = UILabel().then {
        $0.text = "딱 맞춘\n운동리스트"
        $0.textColor = UIColor(named: "Gray-9")
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.numberOfLines = .max
    }
    
    let page2SubLabel = UILabel().then {
        $0.text = "막 학교에 야무지게\n할수있는 그런걸\n적는거다"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-Medium", size: 28)
        $0.numberOfLines = .max
    }
    
    let page3TitleLabel = UILabel().then {
        $0.text = "당신만을\n위한 추천 루틴"
        $0.textColor = UIColor(named: "Gray-9")
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.textAlignment = .center
        $0.numberOfLines = .max
    }
    
    let page3SubLabel = UILabel().then {
        $0.text = "운동 목적에 맞는 루틴\n어쩌구"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-Medium", size: 28)
        $0.textAlignment = .center
        $0.numberOfLines = .max
    }
    
    let page4TitleLabel = UILabel().then {
        $0.text = "간단하게\n가입하고\n동기화"
        $0.textColor = UIColor(named: "Gray-9")
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.textAlignment = .right
        $0.numberOfLines = .max
    }
    
    let page4SubLabel = UILabel().then {
        $0.text = "이름, 학번만으로\n간단하게 가입하세요"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-Medium", size: 28)
        $0.textAlignment = .right
        $0.numberOfLines = .max
    }
    
    let titleLabel = UILabel().then {
        $0.text = "DSM만을 위한\n개인 트레이너,"
        $0.textColor = UIColor(named: "Gray-9")
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.textAlignment = .center
        $0.numberOfLines = .max
    }
    
    let subLabel = UILabel().then {
        $0.text = "커밋헬스"
        $0.textColor = UIColor(named: "Green-5")
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.textAlignment = .center
    }
    
    let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-9"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 24)
        $0.backgroundColor = UIColor(named: "Gray-1")
        $0.layer.cornerRadius = 6
    }
    
    let signUpButton = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-9"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 24)
        $0.backgroundColor = UIColor(named: "Green-5")
        $0.layer.cornerRadius = 6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageScrollView.delegate = self
        self.view.backgroundColor = .systemBackground
        loginButton.addTarget(self, action: #selector(LoginButtonClick), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(SignUpButtonClick), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControlValueChange), for: .valueChanged)
    }
    
    //MARK: - 뷰 시작시 개체위치 설정 함수
    
    override func viewWillLayoutSubviews() {
        startSetting()
        page2Setting()
        page3Setting()
        page4Setting()
        [titleLabel, subLabel].forEach({$0.center.y = self.page1.frame.height / 2 + 10})
        [titleLabel, subLabel, loginButton, signUpButton, pageControl].forEach({$0.alpha = 0})
        
        UIView.animate(withDuration: 1.0, animations: {
            self.titleLabel.center.y = self.page1.frame.height / 2 - 20
            self.subLabel.center.y = self.page1.frame.height / 2 - 20
        }, completion: { (_) in
            UIView.animate(withDuration: 1.0, animations: {
                [self.loginButton, self.signUpButton, self.pageControl].forEach({$0.alpha = 1})
            })
        })
        
        UIView.animate(withDuration: 1.0, animations: {
            self.titleLabel.alpha = 1
            self.subLabel.alpha = 1
        })
    }
    
    //MARK: - 시작시 위치설정 함수
    
    private func startSetting() {
        [loginButton, signUpButton, pageControl, pageScrollView].forEach({self.view.addSubview($0)})
        [titleLabel, subLabel].forEach({page1.addSubview($0)})
        pageScrollView.addSubview(contentView)
        [page1, page2, page3, page4].forEach({contentView.addSubview($0)})
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalTo(self.page1.snp.centerX)
            $0.centerY.equalTo(self.page1.snp.centerY).offset(20)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.centerX.equalTo(titleLabel.snp.centerX)
        }
        
        loginButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.right.equalTo(self.view.snp.centerX).offset(-6)
            $0.width.equalTo(167)
            $0.height.equalTo(67)
        }
        
        signUpButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.left.equalTo(self.view.snp.centerX).offset(6)
            $0.width.equalTo(167)
            $0.height.equalTo(67)
        }
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.bottom.equalTo(signUpButton.snp.top).offset(-28)
            $0.height.equalTo(30)
            $0.width.equalTo(135)
        }
        
        pageScrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalTo(pageControl.snp.top)
            $0.right.left.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(pageScrollView.snp.top)
            $0.bottom.equalTo(pageScrollView.snp.bottom)
            $0.left.equalTo(pageScrollView.snp.left)
            $0.right.equalTo(pageScrollView.snp.right)
            $0.height.equalTo(pageScrollView.snp.height)
            $0.width.equalTo(pageScrollView.snp.width).multipliedBy(4)
        }
        
        page1.snp.makeConstraints {
            $0.height.equalTo(pageScrollView.snp.height)
            $0.width.equalTo(pageScrollView.snp.width)
            $0.centerX.equalTo(pageScrollView.snp.centerX)
        }
        
        page2.snp.makeConstraints {
            $0.height.equalTo(pageScrollView.snp.height)
            $0.width.equalTo(pageScrollView.snp.width)
            $0.centerX.equalTo(pageScrollView.snp.centerX).multipliedBy(3)
        }
        
        page3.snp.makeConstraints {
            $0.height.equalTo(pageScrollView.snp.height)
            $0.width.equalTo(pageScrollView.snp.width)
            $0.centerX.equalTo(pageScrollView.snp.centerX).multipliedBy(5)
        }
        
        page4.snp.makeConstraints {
            $0.height.equalTo(pageScrollView.snp.height)
            $0.width.equalTo(pageScrollView.snp.width)
            $0.centerX.equalTo(pageScrollView.snp.centerX).multipliedBy(7)
        }
    }
    
    private func page2Setting() {
        [page2TitleLabel, page2SubLabel].forEach({page2.addSubview($0)})
        page2TitleLabel.snp.makeConstraints {
            $0.left.equalTo(page2.snp.left).inset(20)
            $0.bottom.equalTo(page2SubLabel.snp.top)
        }
        
        page2SubLabel.snp.makeConstraints {
            $0.left.equalTo(page2.snp.left).inset(20)
            $0.bottom.equalTo(page2.snp.bottom)
        }
    }
    
    private func page3Setting() {
        [page3TitleLabel, page3SubLabel].forEach({page3.addSubview($0)})
        
        page3TitleLabel.snp.makeConstraints {
            $0.centerX.equalTo(page3.snp.centerX)
            $0.centerY.equalTo(page3.snp.centerY)
        }
        
        page3SubLabel.snp.makeConstraints {
            $0.top.equalTo(page3TitleLabel.snp.bottom)
            $0.centerX.equalTo(page3.snp.centerX)
        }
    }
    
    private func page4Setting() {
        [page4TitleLabel, page4SubLabel].forEach({page4.addSubview($0)})
        
        page4TitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(page4.snp.centerY)
            $0.right.equalTo(page4.snp.right).inset(20)
        }
        
        page4SubLabel.snp.makeConstraints {
            $0.top.equalTo(page4TitleLabel.snp.bottom)
            $0.right.equalTo(page4.snp.right).inset(20)
        }
    }
    
    @objc func pageControlValueChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        pageScrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width , y: 0), animated: true)
    }
    
    //MARK: - 버튼 클릭시 함수
    // 화면 전환은 그냥 슬라이드로
    @objc func LoginButtonClick() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func SignUpButtonClick() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let current = pageScrollView.contentOffset.x / view.frame.size.width
        if current.truncatingRemainder(dividingBy: 1.0) == 0 {
            pageControl.currentPage = Int(current)
        }
    }
}
