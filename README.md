# 🪖 Smart Helmet System: Real-time AI Horn Detection

[![Platform](https://img.shields.io/badge/Platform-ESP32-blue?logo=espressif)](https://www.espressif.com/) 
[![Language](https://img.shields.io/badge/Language-C%2B%2B%20%2F%20MATLAB-orange?logo=mathworks)](https://www.mathworks.com/)
[![Accuracy](https://img.shields.io/badge/Accuracy-90.3%25-green)](https://github.com/mohit30905/Smart-helmet-system)

[cite_start]A high-performance, **TinyML-powered** safety wearable designed to enhance rider situational awareness[cite: 1, 2]. [cite_start]This system utilizes an **ESP32** and a custom AI inference engine to detect vehicle horns in real-time, providing immediate haptic feedback to the rider[cite: 3, 4].

---

## 🎯 Overview
Standard helmets and headphones often create an "auditory bubble" that prevents riders from hearing critical safety signals. [cite_start]This project bridges that gap by using **Machine Learning** to monitor ambient audio and alert the rider via vibration when a horn is detected[cite: 2, 5].

### ✨ Key Features
* [cite_start]🧠 **Real-time TinyML**: Employs a trained Ensemble learning model for sub-second audio classification[cite: 2, 5].
* [cite_start]📈 **High Precision**: Achieves a validated **90.3% accuracy** on a balanced dataset of 1,080 samples[cite: 1, 2].
* [cite_start]📳 **Haptic Alerts**: Immediate physical notification via a vibration motor, bypassing auditory noise[cite: 4, 5].
* [cite_start]💰 **Cost-Efficient**: Optimized hardware design with a total budget of approximately **₹510**[cite: 1, 3].
* [cite_start]🧪 **Validated Design**: Verified through rigorous **MATLAB** processing and **Wokwi** simulations[cite: 1, 6].

---

## 🛠️ Technical Architecture

### 🔌 Hardware Stack
* [cite_start]**Microcontroller**: `ESP32` (Dual-core, optimized for multitasking)[cite: 2, 3].
* [cite_start]**Audio Sensor**: `INMP441` (High-precision I2S Digital Microphone)[cite: 2, 4].
* [cite_start]**Actuator**: `Vibration Motor` (NPN-driven for haptic feedback)[cite: 2, 4].

### 🧬 AI & Signal Processing
[cite_start]The system extracts a specialized **5-dimensional feature vector** to ensure reliable detection on low-power hardware[cite: 1, 2]:
1. [cite_start]**Energy**: Monitors overall signal intensity[cite: 1, 2].
2. [cite_start]**Peak Frequency**: Pinpoints dominant tonal spikes unique to vehicle horns[cite: 1, 2].
3. [cite_start]**Spectral Centroid**: Determines the "brightness" or center of the audio spectrum[cite: 1, 2].
4. [cite_start]**Spectral Flux**: Tracks rapid changes in the frequency domain[cite: 1, 2].
5. [cite_start]**Spectral Rolloff**: Filters harmonic signals from random environmental noise[cite: 1, 2].

---

## 📊 Performance & Training
[cite_start]The model was meticulously trained to distinguish between traffic noise, wind, music, and sirens[cite: 2, 5].
* [cite_start]**Framework**: MATLAB Classification Learner App[cite: 2, 6].
* [cite_start]**Algorithm**: Optimizable Ensemble (Bagged Trees) algorithm[cite: 2, 6].
* [cite_start]**Processing**: Leveraged `pwelch` for Power Spectral Density and FFT for frequency isolation between 300Hz and 3kHz[cite: 2, 6].

---

## 🚀 How It Works
1. [cite_start]📡 **Capture**: The `INMP441` streams 24-bit digital audio via the **I2S protocol** to the ESP32[cite: 4, 5].
2. [cite_start]🧹 **Preprocessing**: The ESP32 applies windowing and FFT-based logic to extract the 5 key features[cite: 2, 6].
3. [cite_start]🤖 **Inference**: The internal TinyML model classifies the audio features in real-time[cite: 1, 5].
4. [cite_start]⚠️ **Notification**: Upon detection, a GPIO trigger activates the vibration motor[cite: 4, 5].

---

## 🔮 Future Roadmap
* 🔄 **OTA Updates**: Enable wireless model updates via Wi-Fi.
* 📱 **Companion App**: Bluetooth-enabled sensitivity and notification controls.
* 🎨 **Custom PCB**: Transitioning from breadboard to a compact, helmet-integrated shield.

---

### 👨‍💻 Developer
**Mohit** *Electronics and Communication Engineering Undergraduate* [MNIT Jaipur](https://www.mnit.ac.in/)
