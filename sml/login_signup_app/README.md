[MAD Mini Project Report.pdf](https://github.com/varad-thorat/VistorCounter-App-using-Flutter-and-Firebase/files/11646105/MAD.Mini.Project.Report.pdf)
# login_signup_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

#Setup
step 1 - run the command - flutter pub get 

step 2 - create a firebase account and create a realtime database

step 3 - add your database's - apikey, appid, messagingsenderid, projectid, databaseurl, storagebucket in main.dart FirbaseInitializeApp

step 4 - after downloading the google-services.json file add it in the app/src folder and remove the existing google-service.json if present

step 5 - if you have done connection of ir sensors with the nodemcu then write the following code to connect it to the firebase
//code starts here (to be written in arduino ide)
#include <ESP8266WiFi.h>
#include <Firebase_ESP_Client.h>

// Define the pins for the IR sensors
#define IR_SENSOR_1 D1
#define IR_SENSOR_2 D2

// Initialize counter
int counter = 0;

// Set up your Firebase project credentials
#define FIREBASE_HOST "your-host-id"
#define FIREBASE_AUTH "your-auth-id"
// Initialize Firebase
FirebaseData fbdo;
FirebaseConfig config;
FirebaseAuth auth;

void setup() {
  // Initialize serial communication
  Serial.begin(115200);

  // Set up Wi-Fi connection
  WiFi.begin("(ssid of your wifi)", "(password)");
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("Connected to WiFi");
  // Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  // Set IR sensor pins as input
  pinMode(IR_SENSOR_1, INPUT);
  pinMode(IR_SENSOR_2, INPUT);
  
  // Set up Firebase connection
  config.host = FIREBASE_HOST;
  config.auth = FIREBASE_AUTH;
  Firebase.begin(&config,&auth);
}

void loop() {
  // Read the state of the IR sensors
  int irSensor1State = digitalRead(IR_SENSOR_1);
  int irSensor2State = digitalRead(IR_SENSOR_2);

  // Check if first IR sensor is triggered
  if (irSensor1State == LOW) {
    delay(100); // Debounce delay
    if (irSensor1State == LOW) { // Check again to avoid false triggers
      counter++; 
      Serial.println("Counter increased: " + String(counter));
      Firebase.RTDB.setInt(&fbdo, "/Visitor inside/counter(path of your own node created in firebase database, this is an example)", counter);
    }
  }

  // Check if second IR sensor is triggered
  if (irSensor2State == LOW) {
    delay(100); // Debounce delay
    if (irSensor2State == LOW && counter>0) { // Check again to avoid false triggers
      counter--;
      Serial.println("Counter decreased: " + String(counter));
      Firebase.RTDB.setInt(&fbdo, "/Visitor inside/counter(path of your own node created in firebase database, this is an example)", counter);
    }
  }

  // Delay to avoid overloading the Firebase database with too many requests
  delay(100); // Adjust delay as needed
}
//code ends here

step 6 - flutter run
----------------------------------------------------------------------------------------------------------------------------------------------------

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
