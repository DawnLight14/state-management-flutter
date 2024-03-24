# state-management-flutter
This repository was created for code from a presentation assignment on state management in Flutter.

====

State management in Flutter refers to the process of managing and updating the state of widgets within a Flutter application. State management is crucial for building dynamic, interactive, and responsive user interfaces.
There is 2 types of state:

a. Stateless Widgets: These are widgets whose properties (or state) never change. Once created, they remain the same throughout the lifetime of the widget.

b. Stateful Widgets: These are widgets whose properties (or state) can change over time. Stateful widgets can be rebuilt multiple times with different states, allowing for dynamic UI updates.

====

Some common state management in flutter include:
a. SetState: The simplest form of state management involves using the setState() method provided by the State class to update the state of a widget, suitable for managing the state of simple widgets and small applications.

b. InheritedWidget: InheritedWidget is a mechanism for sharing data (or state) across the widget tree efficiently that allows data to be passed down the widget hierarchy to descendant widgets without explicitly passing it through constructor arguments, useful for managing shared state or data that needs to be accessible by many widgets in the application.

c. Provider: Provider is a popular state management that simplifies the process of passing data (or state) through the widget tree, based on the InheritedWidget mechanism but provides more convenient and efficient way to manage state, and commonly used for managing global or application-level state.

d. Bloc (Business Logic Component): Bloc is a design pattern that separates the presentation layer from business logic that often used in conjunction with streams to manage state and handle user interactions, helps in organizing and managing complex state and asynchronous operations in Flutter applications.

e. GetX: GetX is a state management library that offers a simple and high-performance solution for managing state. It provides tools for managing routes, dependency injection, and state management, making it easy to build complex applications with minimal boilerplate code.

f. Riverpod: Riverpod is another state management library inspired by Provider. It offers a more powerful and flexible solution for managing state and dependencies in Flutter applications. Riverpod is based on the concept of "providers" that can be easily accessed and updated from anywhere in the application.
