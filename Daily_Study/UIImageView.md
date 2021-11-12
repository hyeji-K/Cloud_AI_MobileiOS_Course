# UIImageView
### Assets.xcassets : 이미지 관리 파일

### 1x, 2x, 3x

![1x,2x,3x](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/uiimageview1.png)

- **Pixel 이란?**
    - 픽셀을 몇개를 쓰냐에 따라서 사진의 용량이 결정됨
    - 픽셀의 수로 해상도를 결정함 → 픽셀 개수가 많으면 많을수록 선명하게 나옴
    - FHD(1920 X 1080)
    - 가로가 100Pixel,  세로가 100Pixel 일 때, 전체 픽셀은 100Pixel X 100Pixel  = 10000Pixel

- **PPI (Pixel per Inch) = 밀집도**
    - 1Inch = 2.54cm
    - 같은 크기라도 10PPI와 20PPI는 차이가 남
    - PPI는 높으면 높을수록 좋음 → 선명

- **다양한 iPhone 해상도**
    
    → 아이폰의 해상도가 다양하기 때문에 아이폰의 종류에 따라 사진이 제각각으로 보이게 됨 
    
    → 이를 처리하기 위해서 1x, 2x, 3x로 해상도를 조절해야 함
    
    → 화면의 크기에 맞게 자동으로 해상도가 변화함 
    

- 사진의 좌표 문제(사진의 위치)는 Point로 해결됨

- 해상도 처리 방식
    
    : 3x 기준으로 사진을 만들어서 → 해상도 조절 (1x, 2x를 만들어줌)
    

`💡 Asset Catalog Creator 앱: 해상도 조절 어플`

### [UIImageView 실습](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/tree/master/Example/0830CatViewerTest)
![UIImageView 실습](https://github.com/hyeji-K/Cloud_AI_MobileiOS_Course/blob/master/Daily_Study/image/UIImageView.png)
