#include <ESP8266WiFi.h>

const char* ssid = "YOUR_WIFI_SSID";
const char* password = "YOUR_WIFI_PASSWORD";

WiFiServer server(80);

void setup() {
    Serial.begin(115200);
    Serial.println("Connecting to WiFi");

    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }

    Serial.println("");
    Serial.print("Connected, IP address: ");
    Serial.println(WiFi.localIP());
}

void loop() {
    // Your code to handle commands from the Flutter app
}


// 2nd experiment
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

const char *ssid = "YOUR_WIFI_SSID";
const char *password = "YOUR_WIFI_PASSWORD";

const int port = 80; // HTTP server port
ESP8266WebServer server(port);

String receivedData;

void setup() {
  Serial.begin(115200);
  Serial.println("Connecting to WiFi");

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());

  server.on("/", handleRequest);
  server.begin();
  Serial.println("Server started");
}

void loop() {
  server.handleClient();
}

void handleRequest() {
  if (server.hasArgs()) {
    receivedData = server.arg(0);
    Serial.print("Received data: ");
    Serial.println(receivedData);

    // Your code to process the received data (e.g., control devices)
  }
  
  server.send(200, "text/plain", "Data received"); // Send a simple response
}
