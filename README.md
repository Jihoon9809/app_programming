# 앱 프로그래밍 

✨✨앱 아이디어 구상✨✨

- 뉴스 앱

   구글 플레이스토어의 다양한 뉴스 앱을 참고하여 앱을 구현한다.

   해당 앱은 스크롤을 통하여 새로운 기사의 제목, 사진을 보는 방식으로

   아래의 참고 사진과 유사한 형태로 제작을 목표로 하여

   간략한 날씨정보, 기사글 분류, 사진 및 간략한 내용,

   검색, 로그인 등의 기능을 구현한다.

   + 우측 상단 세팅버튼을 통하여 지역 및 날씨 설정
   + 로그인 및 회원가입 페이지 구현
   + home 페이지를 통하여 전국 뉴스기사 안내
   + 마이 페이지를 구현하여 자신의 정보 안내.
---------------------------------------------------------------------   
- 참고 앱


https://play.google.com/store/search?q=%EB%89%B4%EC%8A%A4&c=apps
---------------------------------------------------------------------

 ![dd1](https://user-images.githubusercontent.com/95200335/157620137-dcd9f71a-d567-4a85-8513-54d0fb1cd723.png)
 ![dd3](https://user-images.githubusercontent.com/95200335/157620796-c170d575-67f6-4620-a37c-17ff1bfae41e.png)
 
---------------------------------------------------------------------
[0317] 사이트맵 구상


![구상도](https://user-images.githubusercontent.com/95200335/174016096-9e23b672-5827-4242-a638-44ac26ccca1a.PNG)



-프로젝트 구현 간 지속적인 수정 

----------------------------------------------------------------------
[0331] 화면 UI 구상.


![디자인 설계](https://user-images.githubusercontent.com/95200335/174028994-5b43ad3a-ce2d-4784-ab47-1bb1cdea14f4.png)

https://www.figma.com/file/qWamL64glecTqhwNVMML14/news-app-design?node-id=0%3A1


메인 페이지
- 검색
- 위치 및 날씨
- 뉴스 기사 사진, 제목, 글 안내
검색을 통해 원하는 글 검색.
위치 및 날씨 아이콘 선택 시 현재 위치 및 날씨 안내.
메인 화면을 통해 뉴스 기사 사진, 제목, 글 내용을 안내한다.

마이페이지
-로그인
-회원가입
-프로필 화면
로그인 및 회원가입 성공 시 프로필 화면으로 이동
로그인 및 회원가입 정보가 없을 시 프로필 화면이 아닌 로그인 화면으로 이동

----------------------------------------------------------------------
[0426] news api 


https://newsapi.org/s/south-korea-news-api
위의 경로에 위치하는 api를 사용할 계획

https://newsapi.org/sources

---------------------------------------------------------------------

[0427] 현재 날씨 정보


https://openweathermap.org/

위의 사이트의 api를 통해 메인 화면의 날싸 위젯을 구성한다.

https://pub.dev/packages/geolocator/example

-날씨 정보를 알려주기 위해 현위치를 알아야 하므로  geolocator을 활용한다.
-readme를 통해 api사용법을 숙지한다.

https://pub.dev/packages/http/install

-날씨 api를 사용하기 위해 http사용

//진행상황//

openweathermap api를 활용하여 플러터의 콘솔에 출력을 하였다.

![날씨 json 파일 불러오기](https://user-images.githubusercontent.com/95200335/165798940-16643d49-73e7-44be-8d16-1f835edad515.png)

![날씨 출력 오류](https://user-images.githubusercontent.com/95200335/165800029-f0a807a0-a9d1-40a2-af9d-f2692147550a.png)


이후 어플의 화면에 지역이름 및 온도를 출력하는 중 오류가 발생하였다.

//차후 진행계획//

-  오류 수정을 하여 앱 화면에 지역이름 및 온도를 출력한다.

- 각 페이지 UI 적용


//오류 수정완료//

![dd](https://user-images.githubusercontent.com/95200335/165882316-3ed0dc8b-4db7-4fab-a057-81927a17ff5a.png)


++++ 참고 +++++

https://www.youtube.com/watch?v=f1VfEEmMRgw

https://www.youtube.com/watch?v=aaGcER1uUoE

https://www.youtube.com/watch?v=7n2QprcdHMA

//////// ListView.Separated ////////////

https://api.flutter.dev/flutter/widgets/ListView-class.html
파이어 베이스 연동////////////////////////////////////////

![파이어베이스](https://user-images.githubusercontent.com/95200335/174080421-f682b285-cac8-4b68-ace8-5a6954cfdead.png)

결과물 이미지////////////////////////////////////////////

![logIn](https://user-images.githubusercontent.com/95200335/174029132-2715b08c-d705-4c57-9ce2-f32adc45a93a.png)
![news_home](https://user-images.githubusercontent.com/95200335/174029159-300f51f3-90bd-45db-88cb-6186ea4d7405.png)
![search](https://user-images.githubusercontent.com/95200335/174029170-a04f00e4-d2a5-484b-aff5-77a1d9c6b8ed.png)
![Sing Up](https://user-images.githubusercontent.com/95200335/174029174-e6445661-1321-466b-9472-5e1adc6a5be0.png)
![Profile](https://user-images.githubusercontent.com/95200335/174029195-5944c6d7-652d-4c76-b0ed-eaaaaf2e4612.png)

