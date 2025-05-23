E-Commerce Flutter App 🚀
A complete, production-ready Flutter e-commerce application powered by RESTful API integration. Designed for scalability, maintainability, and a smooth user shopping experience across platforms.

📌 Project Overview
This Flutter app is a full-fledged e-commerce solution that allows users to:

Browse and search products across multiple categories.

View detailed product information including images, prices, and reviews.

Manage their shopping cart with add/remove/update functionality.

Place orders and track their status (Active, Completed, Canceled).

Manage favorite products with a wishlist.

Authenticate securely using API-based login/signup flows.

Receive real-time feedback and notifications about orders and promotions.

The app uses Bloc/Cubit for state management, ensuring a clean separation between UI and business logic, and is designed with scalability and responsiveness in mind.

🔧 Technologies  &  Tools
Technology         	Purpose
Flutter & Dart	    Cross-platform app development
Bloc / Cubit	      State management & business logic
HTTP / Dio	        RESTful API communication
flutter_svg	        Rendering scalable vector graphics
JSON                Serialization	Data parsing & model conversion
Git & GitHub	       Version control & collaboration

lib/
 └── features/
     └── products/
         ├── data/
         │   ├── products_repo.dart      
         │   └── product_model.dart      
         ├── cubit/
         │   ├── products_cubit.dart      
         │   └── products_state.dart
         └── ui/
             └── products_screen.dart

lib/
 └── features/
     └── orders/
         ├── data/
         │   ├── orders_repo.dart       
         │   └── order_model.dart        
         ├── cubit/
         │   ├── orders_cubit.dart       
         │   └── orders_state.dart
         └── ui/
             └── orders_screen.dart


lib/
 └── features/
     └── categories/
         ├── data/
         │   ├── categories_repo.dart    
         │   └── category_model.dart     
         ├── cubit/
         │   ├── categories_cubit.dart    
         │   └── categories_state.dart
         └── ui/
             └── categories_screen.dart

lib/
 └── features/
     └── sliders/
         ├── data/
         │   ├── sliders_repo.dart        
         │   └── slider_model.dart        
         ├── cubit/
         │   ├── sliders_cubit.dart       
         │   └── sliders_state.dart
         └── ui/
             └── sliders_screen.dart

📐 UI & UX Highlights
Clean, modern design with intuitive navigation.

Filter orders by status: Active, Completed, Canceled.

Responsive layouts optimized for phones and tablets.

Custom reusable widgets for buttons, inputs, and cards.

SVG icons for crisp and scalable graphics.

🛠️ Development Notes
Follow clean architecture by keeping UI, business logic, and data layers separate.

Use model classes for JSON serialization/deserialization.

Handle API errors gracefully with retry and error messages.

Write unit tests for Cubits and repositories (planned for future versions).



