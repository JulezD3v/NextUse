# NextUse ♻️()
still under development
**NextUse** is a Flutter-based mobile application designed to **digitize and streamline waste collection management**.  
The platform connects **households**, **companies**, and **pickup agents** through a structured request and tracking system — promoting efficiency, transparency, and environmental accountability.

[![Flutter](https://img.shields.io/badge/Flutter-3.24+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.5+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

Traditional waste collection systems often suffer from poor coordination, lack of visibility, and no structured tracking.  
**NextUse** solves this by providing a centralized mobile platform where users can:

- Request pickups  
- Monitor request progress in real time  
- Track personal environmental impact metrics  

The app follows **clean architecture** principles to ensure scalability, testability, and long-term maintainability.

## Core Features

### 1. Role-Based Authentication
- Household registration  
- Company registration  
- Pickup agent login  
- Role-specific dashboard & navigation

### 2. Waste Pickup Request Module
- Select waste type  
- Estimate quantity  
- Enter pickup address  
- Choose preferred date/time  
- Submit request workflow

### 3. Request Lifecycle Management
- Real-time status tracking (Pending → Accepted → Completed)  
- Full request history  
- Agent assignment visibility

### 4. Impact & Rewards Tracking
- Pickup count & history  
- Environmental contribution indicators  
- Basic rewards/points system

### 5. Notification System
- In-app notifications for status updates  
- (Future: push notifications)

## Architecture

NextUse follows **clean architecture** with:

- Strict separation of concerns  
- Feature-based folder structure  
- Reusable widgets & components  
- Abstracted service layer for API calls  

State management: **flutter_bloc**  
API communication: **http** + JWT authentication

## Technology Stack

| Layer            | Technology                  |
|------------------|-----------------------------|
| Frontend         | Flutter (Dart)              |
| State Management | flutter_bloc + equatable    |
| Networking       | http                        |
| Secure Storage   | flutter_secure_storage      |
| Backend          | Built with Node.js + Express and RESTful APIs     |
| API Hosting      | Integrations: Paystack/Stripe (payments),         |
                   | SendGrid (emails), LinkedIn (certificate sharing),| 
                   | Vimeo/AWS Media (video hosting). |
| Architecture     | Clean Architecture          |


## Getting Started

### Prerequisites

- Flutter SDK (3.24+ recommended)
- Dart SDK
- Android Studio / VS Code + Flutter & Dart extensions
- Android emulator or physical device (iOS support coming soon)