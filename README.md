# HSL-Frontend
## Welcome to HSl Frontend Application.
Backend: [Backend Repository](https://github.com/Ahmad-Imam/HSL-Backend)
 
## Frontend Information
The project uses Flutter and is developed as a mobile application. You can run the frontend on android by installing flutter and dart on your local machine and run the main file. Or you can directly install the hsl_frontend apk on your android device.
 
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
 
## Frontend Instructions
1. Clone the project
2. Install flutter in your local machine
3. run - pub get
4. run - flutter build
5. run the backend server
6. run - flutter run
7. You can also run the main.dart file
8. You can also skip all the steps and directly install the apk - hsl_frontend
9. Enter the port number from backend and the common ip address with backend
10. Wait for a few moments to establish connection and fetch data.
11. Enjoy
 
## Frontend Features
1. 4 different functionality
 
2. Journey List shows all the journeys included in the first csv file given in the exercise github (https://dev.hsl.fi/citybikes/od-trips-2021/2021-05.csv). Scroll left to right to view all the information. Scroll top to bottom to see all the journeys. All of them are in a pagination. Click on the top right icon to go to the first/last part of the page.
 
3. Station List shows all the station information included in the dataset about station information given in the exercise github. (https://opendata.arcgis.com/datasets/726277c507ef4914b0aec3cbcfcbfafc_0.csv). Scroll left to right to view all the information. Scroll top to bottom to see all the journeys. All of them are in a pagination. Click on the top right icon to go to the first/last part of the page. Click on a row to view specific information about a station.
 
4. Single station has properties like station name, address, station location on the map ,total number of journeys starting from the station, total number of journeys ending at the stationStation location on the map, the average distance of a journey starting from the station, the average distance of a journey ending at the station on the page.
 
5. Add Journey enables to create new journey information based on the user input. The new journey data can be instantly viewed in the journey list and the information is also sent to the backend and written on the csv file.
 
6. Add Station enables to create new station information based on the user input. The new station data can be instantly viewed in the station list and the information is also sent to the backend and written on the csv file.
 
## Sample Screenshots




|  <img src="https://user-images.githubusercontent.com/38004971/210276448-1ab43bfe-ce22-48c4-89a0-59e5833d4541.jpg" width=30% height=30%> |
|:--:|
| *IP ADDRESS SCREEN* |
 
|  <img src="https://user-images.githubusercontent.com/38004971/210276530-0ee31162-7a4b-41c0-884f-9fb0e4305e84.jpg" width=30% height=30%> |
|:--:|
| *HOME SCREEN* |
 
| <img src="https://user-images.githubusercontent.com/38004971/210276539-66fb20c7-e8e6-4636-b9f9-6f4e821dd9fb.jpg" width=30% height=30%> |
|:--:|
| *STATION LIST SCREEN* |
 
|  <img src="https://user-images.githubusercontent.com/38004971/210276542-84b6552f-8cca-4d2d-b11a-95e399432fad.jpg" width=30% height=30%> |
|:--:|
| *ADD STATION SCREEN* |
 
 
 
## Application Information
The application consists of a separate frontend and backend repository.  
- Technology: Frontend: Flutter, Backend: NodeJS.

- The frontend is designed as a mobile application and contains an apk in the repository to install. Unfortunately it is not possible to run the application in ios device as I do not have access to an iphone but incase of ios it will use the same codebase by using the power of cross-platform development in flutter.

- The backend it written in NodeJs and it needs the installation of npm and node to run the backend. The backend runs locally and it needs to be run first before running the frontend. The ip address and port number is important for the frontend so user should remember them. It is possible to change the port number in case there is a problem in that local port.

- After successfully running the backend server, open the frontend application, enter the ip address and port number. Kindly wait some time to load huge amounts of time from the backend. Then enjoy the application
 
## Application Features
- Users can view all the journey information from the first dataset given in the exercise github. Scroll left to right to view all the information. Scroll top to bottom to see all the journeys. All of them are in a pagination.

- Users can view all the station information from the first dataset given in the exercise github. Scroll left to right to view all the information. Scroll top to bottom to see all the stations. All of them are in a pagination.

- Click on one station from the list to see information about a specific station which includes location on the map, station name, address, total number of journeys starting from the station, total number of journeys ending at the stationStation location on the map, the average distance of a journey starting from the station, the average distance of a journey ending at the station.

- Add new journey information by filling up the information required.

- Add new station information by filling up the information required.
 
 
 

