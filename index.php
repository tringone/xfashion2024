<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to X-Fashion</title>
    <style>
        /* Tổng quan */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            background: linear-gradient(to bottom, #d32f2f, #f44336, #ffcccb); /* Gradient đỏ trắng Noel */
            height: 100vh;
            overflow: hidden;
            color: #fff;
        }

        h1 {
            font-size: 3rem;
            margin-top: 30px;
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 20px;
            color: #ffe0e0;
        }

        /* Button Container */
        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        /* Nút Bấm */
        .button {
            padding: 15px 40px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            background: #d32f2f; /* Màu đỏ Noel */
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .button:hover {
            background: #ffffff; /* Hover đổi sang trắng */
            color: #d32f2f;
            transform: translateY(-5px);
            box-shadow: 0 8px 10px rgba(0, 0, 0, 0.5);
        }

        .button i {
            font-size: 20px;
        }

        /* Hiệu Ứng Tuyết Rơi */
        .snow {
            position: fixed;
            top: -10px;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .snowflake {
            position: absolute;
            top: -10px;
            background-color: #fff;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            opacity: 0.8;
            animation: fall linear infinite;
        }

        @keyframes fall {
            to {
                transform: translateY(100vh);
            }
        }

        /* Hiệu Ứng Pháo Hoa */
        .fireworks {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        @keyframes explode {
            0% { transform: scale(0); opacity: 1; }
            100% { transform: scale(1.5); opacity: 0; }
        }

        .firework {
            position: absolute;
            background-color: gold;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            animation: explode 1.5s ease-out infinite;
        }
    </style>
</head>
<body>
    <!-- Nội dung chính -->
    <h1>Welcome to X-Fashion!</h1>
    <p>Embrace the Christmas Spirit</p>
    <div class="button-container">
        <a href="user/index.php" class="button">
            <i class="fas fa-gift"></i> Go to User Page
        </a>
        <a href="admin/index.php" class="button">
            <i class="fas fa-sleigh"></i> Go to Admin Page
        </a>
    </div>

    <!-- Hiệu ứng Tuyết Rơi -->
    <div class="snow"></div>
    <script>
        const snowContainer = document.querySelector('.snow');
        for (let i = 0; i < 100; i++) {
            const snowflake = document.createElement('div');
            snowflake.classList.add('snowflake');
            snowflake.style.left = Math.random() * 100 + 'vw';
            snowflake.style.animationDuration = Math.random() * 5 + 5 + 's';
            snowflake.style.width = snowflake.style.height = Math.random() * 8 + 2 + 'px';
            snowContainer.appendChild(snowflake);
        }
    </script>

    <!-- Hiệu Ứng Pháo Hoa -->
    <div class="fireworks"></div>
    <script>
        const fireworkContainer = document.querySelector('.fireworks');
        for (let i = 0; i < 20; i++) {
            const firework = document.createElement('div');
            firework.classList.add('firework');
            firework.style.left = Math.random() * 100 + 'vw';
            firework.style.top = Math.random() * 100 + 'vh';
            firework.style.backgroundColor = ['gold', 'red', 'white'][Math.floor(Math.random() * 3)];
            firework.style.animationDelay = Math.random() * 2 + 's';
            fireworkContainer.appendChild(firework);
        }
    </script>
</body>
</html>
