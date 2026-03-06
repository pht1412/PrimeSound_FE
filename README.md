# 🚀 Tài Liệu Kiến Trúc Dự Án (Chuẩn AI UI/UX)
## 📌 Nguyên tắc sống còn của Team (Core Rules)
1. **KHÔNG TỰ Ý TẠO THÊM FOLDER GỐC** trong thư mục `lib/`. Mọi tính năng mới đều phải tuân thủ việc gắp/bỏ vào 5 thư mục có sẵn dưới đây.
2. **KHÔNG HARDCODE MÀU SẮC, FONT CHỮ.** Tất cả phải gọi qua `appTheme` và `TextStyleHelper.instance`.
3. **KHÔNG HARDCODE KÍCH THƯỚC.** Mọi con số chiều cao, chiều rộng phải gắn hậu tố `.h` hoặc `.fSize` để giao diện tự động co giãn.

---

## 📂 Cấu trúc thư mục `lib/` và Trách nhiệm

### 1. `core/` (Lõi Ứng Dụng)
* **Mục đích:** Chứa các công cụ, cấu hình và tiện ích dùng chung toàn hệ thống.
* **Thành phần:**
    * `app_export.dart`: File trung chuyển. Muốn import nhiều thư viện, chỉ cần import file này.
    * `utils/image_constant.dart`: Từ điển lưu đường dẫn ảnh (`assets/images/...`).
    * `utils/size_utils.dart`: Thước đo vạn năng hỗ trợ UI Responsive.
    * `utils/navigator_service.dart`: Xử lý chuyển trang không cần context.
    * *(Thêm mới khi cần)* `utils/api_client.dart`: Nơi chứa các hàm cấu hình kết nối mạng (Dio/HTTP) để gọi API.

### 2. `theme/` (Hệ thống Thiết kế - Design System)
* **Mục đích:** Quản lý toàn bộ nhan sắc (Màu sắc, Font chữ) của app.
* **Thành phần:**
    * `theme_helper.dart`: Quản lý mã màu Hex (gọi qua `appTheme`).
    * `text_style_helper.dart`: Quản lý cỡ chữ, độ dày chữ.

### 3. `routes/` (Bản đồ Điều hướng)
* **Mục đích:** Quản lý tên các đường dẫn (URL) của toàn bộ màn hình.
* **Thành phần:** `app_routes.dart` chứa Map định tuyến. Khi tạo màn hình mới, bắt buộc phải đăng ký route vào đây.

### 4. `widgets/` (Kho Linh Kiện UI)
* **Mục đích:** Chứa các component giao diện dùng lại nhiều lần.
* **Thành phần:** `custom_button`, `custom_app_bar`, `custom_image_view`... 
* **Quy tắc:** Chia folder theo tính năng (VD: `widgets/home/`, `widgets/login/`) để không bị lộn xộn.

### 5. `presentation/` (Tầng Giao Diện & Logic Màn Hình)
* **Mục đích:** Chứa từng màn hình của ứng dụng, áp dụng triệt để pattern BLoC.
* **Cấu trúc 1 thư mục màn hình (VD: `login_screen/`):**
    * `login_screen.dart`: Vẽ UI tổng thể (Scaffold).
    * `models/`: Chứa khuôn mẫu dữ liệu (Object) riêng của màn hình đó.
    * `bloc/`:
        * `..._event.dart`: Người dùng làm gì? (Bấm nút, nhập text...).
        * `..._state.dart`: Trạng thái UI hiện tại là gì? (Đang load, Lỗi, Thành công...).
        * `..._bloc.dart`: Xử lý logic, gọi API lấy dữ liệu và trả ra State mới.


====== WORKFLOW======
Bước 1: Chuẩn bị công cụ gọi API (Chỉ làm 1 lần ở core/)

Tạo file lib/core/utils/api_client.dart. Đây sẽ là nơi viết các hàm GET, POST chung nhất. Toàn bộ app sẽ dùng chung file này để bắn request lên server.

Bước 2: Dựng Khung Màn Hình (Vào presentation/)

Tạo folder mới: lib/presentation/login_screen/.
Bên trong tạo đủ 3 phần: file UI login_screen.dart, folder bloc/, và folder models/.

Định nghĩa dữ liệu trả về từ API trong file models/login_model.dart (VD: chứa Token, Thông tin user).

Bước 3: Khai báo Route (Vào routes/)

Bước 4: Bóc tách UI dùng chung (Vào widgets/)
Nếu màn hình Đăng nhập có một ô nhập Password thiết kế đặc biệt, hãy tạo lib/widgets/login/custom_password_input.dart để code cho gọn, sau đó gọi nó vào trong login_screen.dart.

Bước 5: Thổi Logic vào BLoC (Phần quan trọng nhất)
Dev sẽ làm việc trong thư mục presentation/login_screen/bloc/:

Event: Tạo LoginButtonPressedEvent (Khi user bấm Đăng nhập).

State: Tạo các trạng thái: LoginLoading (hiển thị vòng xoay), LoginSuccess (chuyển trang), LoginFailure (báo lỗi sai mật khẩu).

BLoC (Gọi API ở đây): * Khi nhận được LoginButtonPressedEvent, Bloc sẽ gọi hàm từ api_client.dart (từ core/) để ném username/password lên server.

Nếu server trả về OK -> BLoC phát ra (emit) LoginSuccess.
Nếu server báo sai -> BLoC emit LoginFailure.

Bước 6: Gắn vào UI & Chuyển trang

File login_screen.dart lúc này chỉ việc lắng nghe BLoC.

Nếu thấy State là LoginLoading, UI tự hiện vòng quay.
Nếu thấy State là LoginSuccess, UI gọi NavigatorService.pushNamed(AppRoutes.musicHomeScreen) (dùng service ở thư mục core) để đẩy thẳng user vào trang chủ.
<<<<<<< HEAD
=======

==== GIT =====
Trước khi code:
git checkout develop
git pull origin develop
git checkout -b feature/...

Sau khi code xong:
git add .
git commit -m "<type>: <content>"
git push origin feature/...

Cuối cùng lên web GIT:
Tạo Pull Request → develop
Gán reviewer
Lưu ý: 
base: develop
compare: feature/...
>>>>>>> 5f850d70ad6bc58aaaf1fef5d2caed0df7f334de

Lê nguyễn khánh duy 
Baitapvenha123