
# Sử dụng image MySQL cơ bản
FROM mysql:8.0

# Đặt biến môi trường
ENV MYSQL_ROOT_PASSWORD=your_root_password
ENV MYSQL_DATABASE=webbanhangtest
ENV MYSQL_USER=your_user
ENV MYSQL_PASSWORD=your_password

# Copy script SQL vào thư mục /docker-entrypoint-initdb.d
COPY init.sql /docker-entrypoint-initdb.d/