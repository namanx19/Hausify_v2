# Hausify - Version 2

Hausify is a comprehensive e-commerce mobile application built using Flutter, Firebase, GetX, and Razorpay for seamless payment processing. It boasts a robust architecture and a rich feature set, making it an ideal solution for businesses looking to establish a strong online presence.

## Key Features

* **MVC Architecture:** Hausify leverages the Model-View-Controller (MVC) architecture for clear separation of concerns, promoting maintainability and scalability.
* **Highly Modular:** The codebase is meticulously structured into well-defined modules, facilitating efficient development and future enhancements.
* **Highly Scalable:** Hausify is built to accommodate growth effortlessly, allowing you to scale your business operations without technical constraints.
* **Core Design Principles:** The application adheres to established design principles, ensuring a user-friendly and intuitive experience for your customers.
* **Industry Standard Code:** The codebase is crafted following industry best practices, guaranteeing quality and maintainability in the long run.
* **Authentication:** Hausify supports both email and Google sign-in options for convenient user onboarding.
* **Product Search & Filtering:** Users can effortlessly search, filter, and browse products based on category, brand, and name, enabling them to find what they need quickly and easily.
* **Wishlist:** Customers can add desired products to their wishlists for future purchases or sharing with friends.
* **Payment Integration with Razorpay:** Hausify integrates seamlessly with Razorpay, a leading payment gateway in India, to provide a secure and reliable payment experience for your users.
* **State Management with GetX:** GetX is employed for effective state management, simplifying the process of handling application state across different UI components.
* **Admin App for Data Management:** A dedicated admin application empowers you to load data seamlessly over Firebase, streamlining your product management tasks.
* **Firebase Database:** Hausify utilizes Firebase's robust database to store application data and user information, ensuring secure and scalable data management.

## Project Setup

Here's a step-by-step guide to set up Hausify:

1. **Clone this Repository:**
   ```git clone https://github.com/namanx19/Hausify_v2.git```
2. **Install Dependencies:**
   ```flutter pub get```
3. **Configure Firebase Project:**
   <ul>
     <li>Create a Firebase project in the Firebase console.</li>
     <li>Configure your app with the Firebase project details.</li>
   </ul>
   
4. **Add Firebase Configuration Files:**
   <ul>
     <li>Place the generated ```google-services.json``` file (for Android) in the ```android/app``` folder.</li>
     <li>Place the generated ```GoogleService-Info.plist``` file (for iOS) in the ```ios/Runner``` folder.</li>
   </ul>
   
5. **Enable Razorpay Payment Integration:**
   <ul>
     <li>Obtain your Razorpay test API key from the Razorpay dashboard</li>
     <li>In the ```order_controller.dart``` file, replace ```RAZORPAY_API_KEY``` with your actual Razorpay test API key.</li>
   </ul>


## Screenshots
<table>
  <tr>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/695e18df-714b-4a62-98b4-cfd94c005e41" alt="1 onboarding" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/43b105e1-69f2-4abf-8854-9293a45dd02e" alt="2 login" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/820c036d-4fd7-4a32-9fea-7917d6dda618" alt="3 signup" width="300" height="auto"></td>
  </tr>

  <tr>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/3d82d0fb-5bae-4559-b4ce-8054fa23e54f" alt="4 home1" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/4b020794-f32c-463c-b89b-9479bca5e3e1" alt="5 home2" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/c680d4dd-2d36-40e8-aa5c-cf9843e3606a" alt="5 store" width="300" height="auto"></td>
  </tr>

  <tr>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/a5df32c1-68cf-4f5d-9824-5d53bcfe77ec" alt="6 product specific" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/8fdf7427-7b7e-41bc-a05c-1c29a6af78a6" alt="7 wishlist" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/c384f8ef-947b-4c34-8c02-91c3dc8b9fa4" alt="8 profile1" width="300" height="auto"></td>
  </tr>

  <tr>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/865b1769-48fc-447a-ad7c-856947d432d5" alt="8 profile2" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/3aa1a6b7-bfc5-48c9-8c8a-2bb27289c052" alt="8 profile3" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/6c68cb71-d2aa-4900-bf93-6d574f02abcc" alt="9 cart" width="300" height="auto"></td>
  </tr>


  <tr>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/b7671661-eb42-4982-9777-6ea63fb9da3d" alt="10 checkout" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/885f3ddb-73fa-4fb4-8284-d2e451a8712e" alt="11 addresses" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/6d846c8f-8157-44e9-bf03-64c0a8a2e7e3" alt="12 payment methods" width="300" height="auto"></td>
  </tr>

  <tr>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/85bca246-6741-4a19-8d12-d3925c51718f" alt="13 razorpay" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/81841d8a-ea1e-430f-bfbd-8dd8187db5d7" alt="14 razorpay payment screens" width="300" height="auto"></td>
    <td><img src="https://github.com/namanx19/Hausify_v2/assets/71885262/bc89f7b7-fc0b-4a5d-b9ae-dfa5dbb63c47" alt="15 orders" width="300" height="auto"></td>
  </tr>
  
</table>

### Questions or Issues?
Feel free to reach out to ```naman.mw4@gmail.com``` if you have any questions or encounter any issues while setting up or using Hausify. Happy coding!
