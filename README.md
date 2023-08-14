# wanted-pre-onboarding-backend
>원티드 프리온보딩 사전과제.
### 지원자의 성명
  > 🧑 강석민 KANG SEOK MIN
  >> 📧: kmini9611@naver.com

### 애플리케이션의 실행 방법 (엔드포인트 호출 방법 포함)
> 이용회원(MEMBER)
>> 회원가입 /register
>> 로그인  /login

> 게시글(BOARD)
>> 게시글 작성  /board/insert
>> 게시글 상세보기  /board/detail/{num}
>> 게시글 수정      /board/update/{num}
>> 게시글 삭제      /board/delete/{num}
>> 게시글 페이징    /board/list/@Pageable 
>> 게시글 검색(제목/내용)      /board/list/@RequestParam("title") or @RequestParam("content")
### 데이터베이스 테이블 구조 
>Member 테이블(Member_
>>![image](https://github.com/mini1115/wanted-pre-onboarding-backend/assets/101314429/8351c0c4-478a-498b-8b50-42021c4e0c73)
>>> ![image](https://github.com/mini1115/wanted-pre-onboarding-backend/assets/101314429/795c6930-f4d1-4472-bd0e-944d6a630393)

>Board 테이블
>>![image](https://github.com/mini1115/wanted-pre-onboarding-backend/assets/101314429/c3a8d146-ea11-43b5-b682-a9efe7b07a47)
>>>  ![image](https://github.com/mini1115/wanted-pre-onboarding-backend/assets/101314429/0f322581-c8ba-42a0-974d-a039da500596)

### 구현한 API의 동작을 촬영한 데모 영상 링크
> 📹  https://youtu.be/pRRZ9w0tyGI
### 구현 방법 및 이유에 대한 간략한 설명
> Rest API를 이용한 SpringBoot Jpa,Security를 활용한 회원가입, 로그인, 게시판 CRUD ,RDBMS(Mysql) - Member와 Board 1:N 매핑
### API 명세(request/response 포함)
> Swagger.
