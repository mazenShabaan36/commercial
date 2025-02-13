# commercial

A new Flutter project.

## Instalation 

Installation
Clone the repository:

git clone https://github.com/mazenShabaan36/commercial.git
# Navigate to the project directory:
cd commercial
# Install dependencies:
flutter pub get
# Run the app:
flutter run


## Architecture
The project follows a clean and modular structure:
lib/
├── main.dart              # Entry point of the application
├── core/                  # Core functionalities (e.g., constants, utilities)
├── core/di                # contatint the dependency injections for the app
├── data/                  # Data layer (e.g., models, repositories)
├── domain/                # Business logic (e.g., use cases, entities)
├── presentation/          # UI layer (e.g., screens, widgets, BLoCs)

# State Management
The project uses the BLoC (Business Logic Component) pattern for state management, powered by the bloc and flutter_bloc packages. BLoCs are located in the presentation layer.

# Dependency Injection
Dependency injection is handled using get_it. The setup is defined in di.dart in core/di, where all dependencies are registered and initialized.

# Routing
Navigation is managed using go_router, which provides a declarative way to handle routing and deep linking. Routes are defined in lib/core/routers 

# Caching 
Offline Database is managed using Hive , which provide a declarative way to handle caching data . defined in lib/core/hive

# Responsivity 
Responsivity  is managed using flutter_screenutil , which provide a declarative way to handle responisivity



