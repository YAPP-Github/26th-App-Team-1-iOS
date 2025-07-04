import UIKit
import Foundation
import Combine
import BKDomain
import BKData

final class LoginTestViewController: UIViewController {

    // MARK: - Properties

    private let loginService: KakaoLoginService
    private var cancellables = Set<AnyCancellable>()

    // MARK: - UI Components

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카카오 로그인", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인 대기 중..."
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initialization

    init(loginService: KakaoLoginService = KakaoLoginService()) {
        self.loginService = loginService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupBindings()
    }

    // MARK: - Setup Methods

    private func setupLayout() {
        view.addSubview(loginButton)
        view.addSubview(resultLabel)

        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupBindings() {
        loginButton.publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.resultLabel.text = "로그인 시도 중..."
                self.performKakaoLogin()
            }
            .store(in: &cancellables)
    }

    // MARK: - Login Logic

    private func performKakaoLogin() {
        loginService.login()
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    // 성공적으로 토큰을 받았으므로 여기서는 별도의 처리 없음 (receiveValue에서 처리)
                    break
                case .failure(let error):
                    if let authError = error as? AuthError {
                        self.resultLabel.textColor = .systemRed
                        self.resultLabel.text = "로그인 실패: \(authError.localizedDescription)"
                    } else {
                        // 알려지지 않은 오류는 AuthError.unknown으로 래핑
                        self.resultLabel.textColor = .systemRed
                        self.resultLabel.text = "로그인 실패: \(AuthError.unknown.localizedDescription)"
                    }
                }
            }, receiveValue: { [weak self] accessToken in
                guard let self = self else { return }
                self.resultLabel.textColor = .systemGreen
                self.resultLabel.text = "로그인 성공! 🎉\n토큰: \(accessToken.prefix(10))..." // 토큰 일부만 표시
                print("카카오 로그인 성공! Access Token: \(accessToken)")
            })
            .store(in: &cancellables)
    }
}


// UIButton의 UIControl.Event를 Publisher로 변환하기 위한 확장
extension UIControl {
    func publisher(for event: UIControl.Event) -> EventPublisher { // Removed UIControl.
        return EventPublisher(control: self, event: event)
    }

    // struct UIControl.EventPublisher -> struct EventPublisher
    struct EventPublisher: Publisher {
        typealias Output = Void
        typealias Failure = Never

        let control: UIControl
        let event: UIControl.Event

        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Void == S.Input {
            let subscription = EventSubscription(subscriber: subscriber, control: control, event: event) // Removed UIControl.
            subscriber.receive(subscription: subscription)
        }
    }

    // private class UIControl.EventSubscription -> private class EventSubscription
    private class EventSubscription<S: Subscriber>: Subscription where S.Input == Void, S.Failure == Never {
        private var subscriber: S?
        private let control: UIControl
        private let event: UIControl.Event

        init(subscriber: S, control: UIControl, event: UIControl.Event) {
            self.subscriber = subscriber
            self.control = control
            self.event = event
            control.addTarget(self, action: #selector(handleEvent), for: event)
        }

        @objc private func handleEvent() {
            _ = subscriber?.receive(())
        }

        func request(_ demand: Subscribers.Demand) {}

        func cancel() {
            control.removeTarget(self, action: #selector(handleEvent), for: event)
            subscriber = nil
        }
    }
}
