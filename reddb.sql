-- Учебная база данных для проекта RedDbApi
-- MySQL 8.0+ / DBeaver / Docker
-- Скрипт рассчитан на создание новой базы. Для существующей базы сначала сделайте резервную копию.

CREATE DATABASE IF NOT EXISTS reddb
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE reddb;

-- Пользователь приложения. При импорте через DBeaver выполняйте скрипт
-- под администратором MySQL. В Docker пользователь также создаётся переменными
-- MYSQL_USER / MYSQL_PASSWORD в docker-compose.yml.
CREATE USER IF NOT EXISTS 'reddb'@'%' IDENTIFIED BY 'reddb123';
GRANT ALL PRIVILEGES ON reddb.* TO 'reddb'@'%';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS institutions (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS groups_tbl (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  course INT NOT NULL,
  status VARCHAR(50) NOT NULL DEFAULT 'активна',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS students (
  id INT NOT NULL AUTO_INCREMENT,
  fio VARCHAR(255) NOT NULL,
  group_id INT NULL,
  institution_id INT NULL,
  status VARCHAR(50) NOT NULL DEFAULT 'активен',
  PRIMARY KEY (id),
  INDEX ix_students_group (group_id),
  INDEX ix_students_institution (institution_id),
  CONSTRAINT fk_students_group
    FOREIGN KEY (group_id) REFERENCES groups_tbl(id)
    ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT fk_students_institution
    FOREIGN KEY (institution_id) REFERENCES institutions(id)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS exams (
  id INT NOT NULL AUTO_INCREMENT,
  student_id INT NOT NULL,
  subject VARCHAR(255) NOT NULL,
  exam_date DATETIME NULL,
  grade INT NULL,
  status VARCHAR(50) NOT NULL DEFAULT 'запланирован',
  PRIMARY KEY (id),
  INDEX ix_exams_student (student_id),
  CONSTRAINT fk_exams_student
    FOREIGN KEY (student_id) REFERENCES students(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT chk_exams_grade CHECK (grade IS NULL OR grade BETWEEN 1 AND 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Демонстрационные записи. INSERT IGNORE не создаёт дубликаты при повторном импорте.
INSERT IGNORE INTO institutions (id, name) VALUES
  (1, 'Колледж информационных технологий'),
  (2, 'Технический университет');

INSERT IGNORE INTO groups_tbl (id, name, course, status) VALUES
  (1, 'ИС-21', 2, 'активна'),
  (2, 'ПР-31', 3, 'активна');

INSERT IGNORE INTO students (id, fio, group_id, institution_id, status) VALUES
  (1, 'Иванов Иван Иванович', 1, 1, 'активен'),
  (2, 'Петрова Анна Сергеевна', 1, 1, 'активен'),
  (3, 'Сидоров Максим Олегович', 2, 2, 'активен');

INSERT IGNORE INTO exams (id, student_id, subject, exam_date, grade, status) VALUES
  (1, 1, 'Базы данных', '2026-12-15 10:00:00', 5, 'сдан'),
  (2, 2, 'Программирование', '2026-12-17 12:00:00', 4, 'сдан'),
  (3, 3, 'Компьютерные сети', '2026-12-20 09:00:00', NULL, 'запланирован');
