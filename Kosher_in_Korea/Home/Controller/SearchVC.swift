import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var c: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var a: UITextField!

    @IBAction func d(_ sender: Any) {
        // 예약 생성 요청
        guard let date = a.text, let time = b.text, let numberOfPeopleString = c.text, let numberOfPeople = Int(numberOfPeopleString) else {
            print("모든 필드를 올바르게 입력해주세요.")
            return
        }

        let reservation = Reservation(userId: 1,
                                      restaurantId: 1,
                                      reservationDate: date,
                                      reservationTime: time,
                                      numberOfPeople: numberOfPeople,
                                      status: "ㅇㅇ")

        ApiService.createReservation(reservation: reservation) { result in
            switch result {
            case .success:
                print("예약이 성공적으로 생성되었습니다!")
            case .failure(let error):
                print("예약 생성 중 오류 발생: \(error)")
            }
        }
    }

    @IBAction func e(_ sender: Any) {
        // 예약 조회 요청
        ApiService.fetchReservations { result in
            switch result {
            case .success(let reservations):
                for reservation in reservations {
                    print("""
                        -----------------------
                        예약 ID: \(reservation.id)
                        사용자 ID: \(reservation.userId)
                        레스토랑 ID: \(reservation.restaurantId)
                        날짜: \(reservation.reservationDate)
                        시간: \(reservation.reservationTime)
                        사람 수: \(reservation.numberOfPeople)
                        상태: \(reservation.status)
                        """)
                }
            case .failure(let error):
                print("예약 조회 중 오류 발생: \(error)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 추가적인 초기화 코드
    }
    // 나머지 코드...
}
