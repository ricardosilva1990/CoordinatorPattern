# Coordinator Pattern

## What is it?

The Coordinator pattern is a design pattern used to manage data flow between different parts of an application. 

The Coordinator pattern allows for a central point of control for an application. It helps to decouple all parts that compose an application, making it easier to change and maintain it.

There are many ways to implement the Coordinator pattern. This repository aims to design a flexible, scalable, and maintainable navigation system in SwiftUI using a router-based architecture that is suitable for large-scale apps.

## The solution

The solution presented in this repository is based on *Rebeloper - Rebel Developer*'s video [Why You Should Use The SwiftUI Coordinator Pattern](https://www.youtube.com/watch?v=aaLRST7tHFQ), The final solution presented there is fine but not very scalable for larger apps. To overcome this, a solution adapted from *Michael Skuratau*'s [Medium post](https://medium.com/@maydibee/navigation-in-swiftui-flexible-and-scalable-routing-approach-with-stackview-1a819cd9d6f0) was used on top.