-- 1. Создаем базу данных с правильной кодировкой
CREATE DATABASE IF NOT EXISTS my_dbeaver_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Создаем пользователя для DBeaver (замените 'MyStrongPassword123!' на свой надежный пароль)
-- 'localhost' означает, что подключаться можно только с этого же компьютера
CREATE USER IF NOT EXISTS 'dbeaver_user'@'localhost' IDENTIFIED BY 'MyStrongPassword123!';

-- 3. Даем этому пользователю полные права только на эту базу данных
GRANT ALL PRIVILEGES ON my_dbeaver_db.* TO 'dbeaver_user'@'localhost';

-- 4. Применяем изменения прав доступа
FLUSH PRIVILEGES;

