/**
 * @file webserver.ino
 * @author aaaoleu <3
 * @brief Webserver to serve json data (temp & humidity) from a DHT11 (runs on 
 * an ESP32)
 * @version 1.0
 * @date 2021-12-04
 */

#include <WiFi.h>

#include "DHT.h"

/* Server Initialization */
const char* ssid = "aaaoleu";
const char* password = "aoleu123";

WiFiServer server(80);

// Variable to store the HTTP request
String header;

/* DHT Initialization */
#define DHTPIN 4
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);

void setup() {
    Serial.begin(9600);

    // Connect to Wi-Fi network with SSID and password
    Serial.print("Connecting to ");
    Serial.println(ssid);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    // Print local IP address and start web server
    Serial.println("");
    Serial.println("WiFi connected.");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
    server.begin();

    Serial.println(F("DHT Init!"));

    dht.begin();
}

void loop() {
    WiFiClient client = server.available();

    if (client) {
        // Check for a new client
        Serial.println("New Client.");
        String currentLine = "";

        while (client.connected()) {
            // Read the humidity
            float h = dht.readHumidity();
            // Read temperature as Celsius
            float t = dht.readTemperature();

            // Check if any reads failed and exit early (to try again).
            if (isnan(h) || isnan(t)) {
                Serial.println(F("Failed to read from DHT sensor!"));
                return;
            }

            if (client.available()) {
                char c = client.read();
                Serial.write(c);
                header += c;
                if (c == '\n') {
                    if (currentLine.length() == 0) {
                        // HTTP headers:
                        client.println("HTTP/1.1 200 OK");
                        client.println("Content-type:text/html");
                        client.println("Connection: close");
                        client.println();

                        // HTTP response:
                        client.print("{\"temperature\": ");
                        client.println(t);
                        client.print(", \"humidity\": ");
                        client.println(h);
                        client.println("}");

                        // The HTTP response end
                        client.println();
                        break;
                    } else {
                        currentLine = "";
                    }
                } else if (c != '\r') {
                    currentLine += c;
                }
            }
        }
    }
}

// EOF