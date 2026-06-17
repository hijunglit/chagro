import 'dart:convert';

import 'package:chagro/models/book_model.dart';

class ApiService {
  final String _bookRawJson = '''
  [
  {
    "id": "book_001",
    "title": "고요한 도시의 기록",
    "author": "이서윤",
    "coverUrl": "https://picsum.photos/seed/book001/300/450",
    "summary": "잠들지 않는 도시에서 사라진 사람들의 흔적을 추적하는 기록자의 이야기.",
    "tags": ["소설", "미스터리", "도시"],
    "totalPages": 328,
    "rating": 4.3,
    "memo": "문장이 차분하고 분위기가 좋음. 후반부 전개 확인 필요."
  },
  {
    "id": "book_002",
    "title": "작게 시작하는 시스템",
    "author": "한도윤",
    "coverUrl": "https://picsum.photos/seed/book002/300/450",
    "summary": "복잡한 목표를 작은 루틴과 자동화된 구조로 바꾸는 실용적인 방법을 다룬 책.",
    "tags": ["자기관리", "생산성", "실용"],
    "totalPages": 241,
    "rating": 4.6,
    "memo": "앱 기능 아이디어로 연결하기 좋음. 체크리스트 UI에 참고."
  },
  {
    "id": "book_003",
    "title": "푸른 행성의 끝에서",
    "author": "강민재",
    "coverUrl": "https://picsum.photos/seed/book003/300/450",
    "summary": "기후가 무너진 미래 지구에서 마지막 항해를 떠나는 탐사대의 SF 이야기.",
    "tags": ["SF", "모험", "디스토피아"],
    "totalPages": 412,
    "rating": 4.1,
    "memo": "세계관이 강함. 표지 카드에 어두운 톤이 어울릴 듯."
  },
  {
    "id": "book_004",
    "title": "일의 감각",
    "author": "박지훈",
    "coverUrl": "https://picsum.photos/seed/book004/300/450",
    "summary": "좋은 결과를 만드는 사람들의 사고방식, 우선순위, 실행 습관을 정리한 책.",
    "tags": ["비즈니스", "커리어", "실행"],
    "totalPages": 286,
    "rating": 4.8,
    "memo": "중요 문장 저장 기능 테스트용으로 적합."
  },
  {
    "id": "book_005",
    "title": "밤의 도서관",
    "author": "윤하린",
    "coverUrl": "https://picsum.photos/seed/book005/300/450",
    "summary": "자정이 되면 열리는 비밀 도서관에서 각자의 잃어버린 기억을 찾는 사람들.",
    "tags": ["판타지", "감성", "드라마"],
    "totalPages": 354,
    "rating": 4.5,
    "memo": "메모가 길어졌을 때 UI 줄바꿈 테스트하기 좋음."
  },
  {
    "id": "book_006",
    "title": "리팩토링의 기술",
    "author": "김태성",
    "coverUrl": "https://picsum.photos/seed/book006/300/450",
    "summary": "복잡해진 코드베이스를 안전하게 개선하는 방법과 실전 사례를 설명한다.",
    "tags": ["개발", "소프트웨어", "리팩토링"],
    "totalPages": 478,
    "rating": 4.9,
    "memo": "개발자 독서 앱이라면 이런 기술서 데이터도 필요할 듯."
  },
  {
    "id": "book_007",
    "title": "검은 파도",
    "author": "정우혁",
    "coverUrl": "https://picsum.photos/seed/book007/300/450",
    "summary": "정체불명의 재난이 해안을 덮치며 벌어지는 생존 스릴러.",
    "tags": ["스릴러", "재난", "액션"],
    "totalPages": 391,
    "rating": 4.2,
    "memo": "긴 제목 UI 테스트를 위해 제목을 더 길게 만들어도 좋을 것 같음."
  },
  {
    "id": "book_008",
    "title": "습관의 알고리즘",
    "author": "최수빈",
    "coverUrl": "https://picsum.photos/seed/book008/300/450",
    "summary": "반복 행동이 형성되는 과정을 심리학과 행동과학 관점에서 분석한다.",
    "tags": ["심리학", "습관", "자기계발"],
    "totalPages": 267,
    "rating": 4.4,
    "memo": "독서 메모 기능에서 하이라이트 예시로 사용 가능."
  }
]
  ''';

  Future<List<BookModel>> getBooks() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final List<dynamic> decodedData = jsonDecode(_bookRawJson);

    return decodedData.map((json) => BookModel.fromJson(json)).toList();
  }
}
