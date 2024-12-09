import { mysql } from "mysql";

const connection = mysql.createConnection({
  host: "localhost", // Địa chỉ máy chủ MySQL
  port: 3308, // Port mặc định của MySQL
  user: "duc_viet_dz", // Tên người dùng MySQL
  password: "271109", // Mật khẩu MySQL
  database: "webbanhangtest", // Tên cơ sở dữ liệu
});

connection.connect((err) => {
  if (err) {
    console.error("Error connecting to database:", err.stack);
    return;
  }
  console.log("Connected to database.");
});
