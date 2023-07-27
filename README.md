# Flutter Internship Assignment

This Flutter project is a short internship assignment that involves fetching data from APIs and using them to create a mobile application. The application consists of three screens - Home Screen, Search Screen, and Filter Bottom Sheet.

## Project Description

The main objectives of this project are:

1. Fetching Data: The app uses two different GET APIs to fetch data. One API is used to fetch device model details, and the other API is used to fetch filters.

2. Search Functionality: The app utilizes a POST API to search for devices using make and model as search criteria.

3. Screen Descriptions:
    - Home Screen: Displays device-related content with infinite scrolling and allows users to navigate to the Search Screen and open the Filter Bottom Sheet.
    - Search Screen: Displays search results based on the user's input for make and model.
    - Filter Bottom Sheet: Presents options to the user for filtering device data on the Home Screen.

4. Cache Image: The app incorporates the cached image mechanism to optimize memory management and improve overall performance.

## Memory Management Techniques

1. **Efficient Data Structures:** I have utilized appropriate data structures such as Lists, Sets, and Maps to store and manage data efficiently.

2. **Resource Disposal:** I have also implemented Dispose of resources like streams, controllers, and listeners using the `dispose()` method in Stateful widgets to release them properly.

3. **Optimized Widget Rebuilding:** Used `const` constructors for stateless widgets to avoid unnecessary widget rebuilding and reduce widget reconstruction overhead.

4. **Smart Widget Selection:** Chosen the right type of widgets for specific tasks, such as using `ListView.builder()` for long lists to avoid loading all items at once.

5. **Image Caching:** Implemented caching of images using `precacheImage` from Flutter to preload images and reduce loading time. This helps in improving memory management and performance when displaying images from the network.

6. **Garbage Collection:** Utilized Flutter's garbage collector to automatically release unused resources and objects.

7. **Memory Profiling:** Used Flutter DevTools or Android Studio's profiler to analyze memory usage and identify any potential memory leaks.

8. **Efficient Animations:** I was cautious with animations as they can consume memory. So I used `AnimatedContainer` or `AnimatedBuilder` for optimized animation performance and also disposed their controllers using `dispose()` method in Stateful widget to optimise both performance and memory.

9. **State Management Solutions:** Utilized state management solutions like `Bloc/Cubit` to manage state efficiently and prevent memory leaks associated with manual state management.

10. **Testing on Low-End Devices:** Tested the app on low-end devices with Android Level 11 to ensure optimal performance on devices with limited memory.

11. **Limited Caching:** I was mindful of excessive caching, as it can lead to memory bloat. Cached only essential data and cleared caches when no longer needed.

12. **Static Analysis:** Used the `flutter analyze` command to identify potential issues and follow the recommendations to improve memory efficiency.
## Getting Started

### Prerequisites

To run this project, you need to have the following installed on your computer:

1. Flutter SDK - [Install Flutter](https://flutter.dev/docs/get-started/install)
2. Dart SDK - [Install Dart](https://dart.dev/get-dart)

### Setup

1. Clone this repository to your local machine using the following command:
   git clone https://github.com/itsvinayyay/mobilicis


2. Navigate to the project directory.


3. Install the project dependencies by running:
   flutter pub get


### Running the App

To run the app on your connected device (simulator/emulator or physical device), use the following command:

flutter run

This will compile the Flutter code and launch the app on your device.

### Testing

To run the unit tests for the project, use the following command:
flutter test

This will execute all the test cases in the `test` directory.

## Contributing

If you'd like to contribute to this project, please follow the standard guidelines for pull requests and issues.

## License

This project is licensed under the [MIT License](LICENSE).

Feel free to reach out for any questions or support related to this Flutter internship assignment.








