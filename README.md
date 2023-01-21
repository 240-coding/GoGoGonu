# GOGO! GONU

한국의 민속 놀이인 **고누**를 플레이 할 수 있는 Swift Playground App입니다.

이 프로젝트는 Swift Student Challenge 2022에서 🏆 **Winner** 🏆로 선정되었습니다. 

| <img width="350" src="https://user-images.githubusercontent.com/68412683/213888167-f3088e20-5ec3-45d5-b4b2-47e52696b9d1.png"> | <img width="350" src="https://user-images.githubusercontent.com/68412683/213888169-09d09392-96ee-4522-8bf3-4dbd8241e6f0.png"> | <img width="350" src="https://user-images.githubusercontent.com/68412683/213888170-03bfe094-9e85-4c81-8f3d-861233085b97.png"> |
| --- | --- | --- |



## 실행 방법

- Mac에 Swift Playgrounds를 설치하면 Mac에서 바로 플레이 할 수 있습니다.
- AirDrop으로 앱을 실행할 기기에 `GoGoGonu.swiftpm` 파일을 보내면 Swift Playgrounds에서 GOGO! GONU를 플레이 할 수 있습니다.

세로 모드로 실행을 권장합니다.

## 기술 스택

- SwiftUI
- AVKit

## Project Introduction (English)

My app project is an app about Gonu, a Korean folk game. Users can play Gonu on this app. The app is all built with SwiftUI. On the main screen, there are two menus, 'how to play' and 'start', along with the logo of my project. In the how to play screen, users can see a brief introduction to Gonu and the game rule. When you press the start menu, users need to select the type of Gonu first. In both types, there is a Gonu board in the middle of the screen, and information related to the game progress is displayed at the bottom of the screen. The most elaborate parts of the project are the implementation of boards and the movement of pieces. First, the board was drawn programmatically using Path. Lines and circles were drawn based on the center of the screen so that the positions of the pieces on the board could be easily calculated. Buttons that play the role of pieces are placed in all positions on the board. These were also arranged by adjusting the offset value based on the center of the screen. The piece will be moved after the user selects a piece to move and selects a position to move the piece. After moving the piece, we need to check whether the game is over. Since the game is over when there are no more moveable positions, we check whether all adjacent positions of the opponent's pieces are empty. In addition, this app supports single player mode and multiplayer mode so that user can enjoy the game alone or not. In single mode, the user moves the red piece, and the program moves the blue piece. Since the game method of Gonu is simple, in order to move the piece by the program, we just calculate all movable positions and select a location to move at random.
