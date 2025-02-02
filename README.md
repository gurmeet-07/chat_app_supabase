# 🚀 Flutter Supabase Chat App

A real-time chat application built with Flutter, Supabase, and Bloc for state management. This project leverages Supabase for authentication and real-time database functionality.

## 📌 Tech Stack

- **Flutter** – Cross-platform UI toolkit for building natively compiled applications.
- **Supabase** – Open-source Firebase alternative providing real-time database and authentication.
- **Bloc** – Predictable state management library for Flutter.
- **GoRouter** – Declarative routing package for Flutter applications.
- **Dart** – Primary programming language for Flutter applications.

---

## 🔧 Project Setup

### 1️⃣ Clone the Repository
```sh
 git clone https://github.com/gurmeet-07/chat_app_supabase
 cd chat_app_supabase
```

### 2️⃣ Install Dependencies
```sh
 flutter pub get
```

### 3️⃣ Setup Supabase

1. **Create a Supabase Project**  
   - Go to [Supabase](https://supabase.com/), create a new project, and copy your `Project URL` and `anon key`.
   
2. **Set up Supabase in Flutter**  
   - Add the `supabase_flutter` dependency to `pubspec.yaml`:
   
     ```yaml
     dependencies:
       supabase_flutter: ^2.8.3
     ```
   
   - Initialize Supabase in `main.dart`:
     
     ```dart
     import 'package:flutter/material.dart';
     import 'package:supabase_flutter/supabase_flutter.dart';

     void main() async {
       WidgetsFlutterBinding.ensureInitialized();
       await Supabase.initialize(
         url: 'YOUR_SUPABASE_URL',
         anonKey: 'YOUR_SUPABASE_ANON_KEY',
       );
       runApp(MyApp());
     }
     ```

3. **Configure Authentication**  
   - Enable authentication providers in the Supabase dashboard (Email/Password, Google, etc.).

4. **Set Up Database Tables**  
   - Create a `messages` table with the following columns:
     - `id` (UUID, Primary Key, Default: `gen_random_uuid()`)
     - `user_id` (UUID, Foreign Key to `auth.users`)
     - `content` (Text, Not Null)
     - `created_at` (Timestamp, Default: `now()`)

   - Enable **Row Level Security (RLS)** and add policies for user access.

5. **Enable Supabase Realtime**  
   - Go to **Database > Replication** and enable **Realtime** on the `messages` table.

---

## 🚀 Running the App
```sh
 flutter run
```

To run the app with hot reload, use:
```sh
 flutter run --hot
```

---

## 🛠 Features

✅ Supabase Authentication (Email/Password, OAuth)
✅ Real-time Chat using Supabase Realtime Database
✅ Bloc-based State Management
✅ Secure User Access with RLS Policies
✅ Responsive UI with Flutter

---

## 📄 License
This project is licensed under the [MIT License](LICENSE).

---

## 🤝 Contributing
We welcome contributions! Please follow the standard GitHub workflow:
1. Fork the repository
2. Create a new branch (`feature/my-feature`)
3. Commit your changes
4. Push to your fork
5. Open a pull request

