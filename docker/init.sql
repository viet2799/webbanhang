-- init.sql
CREATE DATABASE IF NOT EXISTS webbanhangtest;

USE webbanhangtest;

CREATE TABLE IF NOT EXISTS sanpham (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_sp VARCHAR(255) NOT NULL,
    gia DECIMAL(10, 2) NOT NULL,
    mo_ta TEXT,
    anh VARCHAR(255),
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS khachhang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_kh VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    mat_khau VARCHAR(255) NOT NULL,
    dia_chi TEXT,
    sdt VARCHAR(15),
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS donhang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_khachhang INT NOT NULL,
    tong_tien DECIMAL(10, 2) NOT NULL,
    trang_thai VARCHAR(50),
    ngay_dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_khachhang) REFERENCES khachhang(id)
);

CREATE TABLE IF NOT EXISTS chitietdonhang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_donhang INT NOT NULL,
    id_sanpham INT NOT NULL,
    so_luong INT NOT NULL,
    gia DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_donhang) REFERENCES donhang(id),
    FOREIGN KEY (id_sanpham) REFERENCES sanpham(id)
);