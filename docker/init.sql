-- Tạo cơ sở dữ liệu
CREATE DATABASE web_ban_hang;
USE web_ban_hang;

-- Tạo bảng Khách Hàng
CREATE TABLE khach_hang (
    kh_id INT AUTO_INCREMENT PRIMARY KEY,
    ten_kh VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    mat_khau VARCHAR(255) NOT NULL,
    dia_chi VARCHAR(255),
    so_dien_thoai VARCHAR(15)
);

-- Tạo bảng Sản Phẩm
CREATE TABLE san_pham (
    sp_id INT AUTO_INCREMENT PRIMARY KEY,
    ten_sp VARCHAR(100) NOT NULL,
    mo_ta TEXT,
    gia DECIMAL(10, 2) NOT NULL,
    so_luong INT NOT NULL,
    hinh_anh VARCHAR(255)
);

-- Tạo bảng Đơn Hàng
CREATE TABLE don_hang (
    dh_id INT AUTO_INCREMENT PRIMARY KEY,
    kh_id INT NOT NULL,
    ngay_dat_hang DATETIME NOT NULL,
    tong_tien DECIMAL(10, 2) NOT NULL,
    trang_thai VARCHAR(50) NOT NULL,
    FOREIGN KEY (kh_id) REFERENCES khach_hang(kh_id)
);

-- Tạo bảng Chi Tiết Đơn Hàng
CREATE TABLE chi_tiet_don_hang (
    ctdh_id INT AUTO_INCREMENT PRIMARY KEY,
    dh_id INT NOT NULL,
    sp_id INT NOT NULL,
    so_luong INT NOT NULL,
    gia DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (dh_id) REFERENCES don_hang(dh_id),
    FOREIGN KEY (sp_id) REFERENCES san_pham(sp_id)
);

-- Tạo bảng Danh Mục Sản Phẩm
CREATE TABLE danh_muc (
    dm_id INT AUTO_INCREMENT PRIMARY KEY,
    ten_dm VARCHAR(100) NOT NULL
);

-- Tạo bảng Liên Kết Sản Phẩm và Danh Mục
CREATE TABLE san_pham_danh_muc (
    sp_id INT NOT NULL,
    dm_id INT NOT NULL,
    PRIMARY KEY (sp_id, dm_id),
    FOREIGN KEY (sp_id) REFERENCES san_pham(sp_id),
    FOREIGN KEY (dm_id) REFERENCES danh_muc(dm_id)
);
