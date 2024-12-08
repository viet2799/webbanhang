// server.js
const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Sử dụng body-parser để xử lý dữ liệu từ request
app.use(bodyParser.json());

// Kết nối đến MySQL
const db = mysql.createConnection({
  host: 'localhost:3308',
  user: 'duc_viet_dz',
  password: '271109',
  database: 'webbanhangtest'
});

// Kết nối đến cơ sở dữ liệu
db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err.stack);
    return;
  }
  console.log('db.threadId',db.threadId);
  console.log('Connected to MySQL as id ' + db.threadId);
});

// Định nghĩa các route CRUD

// Create (Thêm Sản Phẩm)
app.post('/sanpham', (req, res) => {
  const { ten_sp, gia, mo_ta, anh } = req.body;
  const query = 'INSERT INTO sanpham (ten_sp, gia, mo_ta, anh) VALUES (?, ?, ?, ?)';
  db.query(query, [ten_sp, gia, mo_ta, anh], (err, result) => {
    if (err) {
      console.error('Error inserting product:', err);
      return res.status(500).send('Error inserting product');
    }
    res.status(201).send('Product created successfully');
  });
});

// Read (Lấy Tất Cả Sản Phẩm)
app.get('/sanpham', (req, res) => {
  const query = 'SELECT * FROM sanpham';
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error retrieving products:', err);
      return res.status(500).send('Error retrieving products');
    }
    res.json(results);
  });
});

// Read (Lấy Sản Phẩm Theo ID)
app.get('/sanpham/:id', (req, res) => {
  const { id } = req.params;
  const query = 'SELECT * FROM sanpham WHERE id = ?';
  db.query(query, [id], (err, results) => {
    if (err) {
      console.error('Error retrieving product:', err);
      return res.status(500).send('Error retrieving product');
    }
    if (results.length === 0) {
      return res.status(404).send('Product not found');
    }
    res.json(results[0]);
  });
});

// Update (Cập Nhật Sản Phẩm)
app.put('/sanpham/:id', (req, res) => {
  const { id } = req.params;
  const { ten_sp, gia, mo_ta, anh } = req.body;
  const query = 'UPDATE sanpham SET ten_sp = ?, gia = ?, mo_ta = ?, anh = ? WHERE id = ?';
  db.query(query, [ten_sp, gia, mo_ta, anh, id], (err, result) => {
    if (err) {
      console.error('Error updating product:', err);
      return res.status(500).send('Error updating product');
    }
    if (result.affectedRows === 0) {
      return res.status(404).send('Product not found');
    }
    res.send('Product updated successfully');
  });
});

// Delete (Xóa Sản Phẩm)
app.delete('/sanpham/:id', (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM sanpham WHERE id = ?';
  db.query(query, [id], (err, result) => {
    if (err) {
      console.error('Error deleting product:', err);
      return res.status(500).send('Error deleting product');
    }
    if (result.affectedRows === 0) {
      return res.status(404).send('Product not found');
    }
    res.send('Product deleted successfully');
  });
});

// Khởi động server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});