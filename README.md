# 🪖 Smart Helmet System: Real-time AI Horn Detection

[![Platform](https://img.shields.io/badge/Platform-ESP32-blue?logo=espressif)](https://www.espressif.com/) 
[![Language](https://img.shields.io/badge/Language-C%2B%2B%20%2F%20MATLAB-orange?logo=mathworks)](https://www.mathworks.com/)
[![Accuracy](https://img.shields.io/badge/Accuracy-90.3%25-green)](https://github.com/mohit30905/Smart-helmet-system)

A high-performance, **TinyML-powered** safety wearable designed to enhance rider situational awareness. This system utilizes an **ESP32** and a custom AI inference engine to detect vehicle horns in real-time, providing immediate haptic feedback to the rider.

---

## 🎯 Overview
Standard helmets and headphones often create an "auditory bubble" that prevents riders from hearing critical safety signals. This project bridges that gap by using **Machine Learning** to monitor ambient audio and alert the rider via vibration when a horn is detected.

### ✨ Key Features
* 🧠 **Real-time TinyML**: Employs a trained Ensemble learning model for sub-second audio classification.
* 📈 **High Precision**: Achieves a validated **90.3% accuracy** on a balanced dataset of 1,080 samples.
* 📳 **Haptic Alerts**: Immediate physical notification via a vibration motor, bypassing auditory noise.
* 💰 **Cost-Efficient**: Optimized hardware design with a total budget of approximately **₹510**.
* 🧪 **Validated Design**: Verified through rigorous **MATLAB** processing and **Wokwi** simulations.

---

## 🛠️ Technical Architecture

### 🔌 Hardware Stack
* **Microcontroller**: `ESP32` (Dual-core, optimized for multitasking).
* **Audio Sensor**: `INMP441` (High-precision I2S Digital Microphone).
* **Actuator**: `Vibration Motor` (NPN-driven for haptic feedback).

### 🧬 AI & Signal Processing
The system extracts a specialized **5-dimensional feature vector** to ensure reliable detection on low-power hardware:
1. **Energy**: Monitors overall signal intensity.
2. **Peak Frequency**: Pinpoints dominant tonal spikes unique to vehicle horns.
3. **Spectral Centroid**: Determines the "brightness" or center of the audio spectrum.
4. **Spectral Flux**: Tracks rapid changes in the frequency domain.
5. **Spectral Rolloff**: Filters harmonic signals from random environmental noise.

---

## 📊 Performance & Training
The model was meticulously trained to distinguish between traffic noise, wind, music, and sirens.
* **Framework**: MATLAB Classification Learner App.
* **Algorithm**: Optimizable Ensemble (Bagged Trees) algorithm.
* **Processing**: Leveraged `pwelch` for Power Spectral Density and FFT for frequency isolation between 300Hz and 3kHz.

---

## 🚀 How It Works
1. 📡 **Capture**: The `INMP441` streams 24-bit digital audio via the **I2S protocol** to the ESP32.
2. 🧹 **Preprocessing**: The ESP32 applies windowing and FFT-based logic to extract the 5 key features.
3. 🤖 **Inference**: The internal TinyML model classifies the audio features in real-time.
4. ⚠️ **Notification**: Upon detection, a GPIO trigger activates the vibration motor.

---

## 🔮 Future Roadmap
* 🔄 **OTA Updates**: Enable wireless model updates via Wi-Fi.
* 📱 **Companion App**: Bluetooth-enabled sensitivity and notification controls.
* 🎨 **Custom PCB**: Transitioning from breadboard to a compact, helmet-integrated shield.

---

### 👨‍💻 Developer
**Mohit** *Electronics and Communication Engineering Undergraduate*
