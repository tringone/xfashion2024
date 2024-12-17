<?php
function connectdb() {
    // Thông tin kết nối MySQL Azure
    $servername = "xfashion2024-server.mysql.database.azure.com"; // Tên server Azure MySQL
    $username = "yxcruhxtfd"; // Username từ Azure
    $password = "TmRwo$3IAdw6QuWz"; // Password từ Azure
    $dbname = "fashion"; // Tên database của bạn
    $port = 3306; // Cổng mặc định MySQL

    try {
        // Chuỗi kết nối PDO
        $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname;charset=utf8", $username, $password);
        
        // Thiết lập chế độ báo lỗi và exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // echo "Connected successfully"; // Kiểm tra kết nối
        return $conn;
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        return null;
    }
}
?>
