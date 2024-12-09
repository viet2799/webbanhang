
# Sử dụng image MySQL cơ bản
FROM mysql:8.0

# Đặt biến môi trường
ENV MYSQL_ROOT_PASSWORD=271109
ENV MYSQL_DATABASE=webbanhangtest
ENV MYSQL_USER=duc_viet_dz
ENV MYSQL_PASSWORD=271109


# Copy script SQL vào thư mục /docker-entrypoint-initdb.d
COPY init.sql /docker-entrypoint-initdb.d/