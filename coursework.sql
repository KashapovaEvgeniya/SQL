
-- Создаём БД. На основе сайте ivi.ru. Хранение фильмом, мультфильмов и сериалов. 
--  Пользователи, которые могут покупать просмотр и оставлять своит отзывы, рейтиги и рецензии.


CREATE DATABASE ivi;

-- Делаем её текущей
USE ivi;

-- Создаём таблицу пользователей
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";  

-- Таблица профилей
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя", 
  gender CHAR(1) NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  city VARCHAR(130) COMMENT "Город проживания",
  country VARCHAR(130) COMMENT "Страна проживания",
  subscription_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип подписки",
  last_login DATETIME COMMENT "Последний вход в систему",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили"; 

-- Таблица подписки
CREATE TABLE subscription (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Сроки подписки",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "сроки подписки";

-- Таблица каталог
CREATE TABLE catalog (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название ",
  genre_id INT UNSIGNED NOT NULL COMMENT "Ссылка на жанр",
  type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип",
  rating_id INT UNSIGNED NOT NULL COMMENT "Ссылка на рейтинг",
  country_creation VARCHAR(130) COMMENT "Страна создания",
  year_creation YEAR COMMENT "Год создания", 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Каталог";

-- Таблица видео
CREATE TABLE video (
  catalod_id INT UNSIGNED NOT NULL COMMENT "Ссылка на каталог",
  reviews_id INT UNSIGNED NOT NULL COMMENT "Ссылка на рецензию",
  format_id INT UNSIGNED NOT NULL COMMENT "Ссылка на формат",
  feedback_id INT UNSIGNED NOT NULL COMMENT "Ссылка на отзывы",
  story TEXT NOT NULL COMMENT "Текст сюжета", 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "профиль видео";


-- Таблица жанров
CREATE TABLE genre (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name_genre VARCHAR(255) NOT NULL UNIQUE COMMENT "Название жанра",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "название жанров";

-- Таблица типов
CREATE TABLE type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name_type VARCHAR(255) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "название типов";

-- Таблица рейтингов
CREATE TABLE rating (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  average_rating INT UNSIGNED NOT NULL COMMENT "Средний рейтинг",
  directing_rating INT UNSIGNED NOT NULL COMMENT "Рейтинг за режиссуру",
  story_rating INT UNSIGNED NOT NULL COMMENT "Рейтинг за сюжет",
  entertainment_rating INT UNSIGNED NOT NULL COMMENT "Ррейтинг за зрелищность ",
  actors_rating INT UNSIGNED NOT NULL COMMENT "Рейтинг за актеров",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Рейтинги";

-- Таблица рецензий
CREATE TABLE reviews (
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя", 
  catalod_id INT UNSIGNED NOT NULL COMMENT "Ссылка на каталог",
  body TEXT NOT NULL COMMENT "Текст отзыва",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  PRIMARY KEY (user_id, catalod_id)
) COMMENT "рецензии";

drop table  reviews;

-- Таблица отзывов
CREATE TABLE feedback (
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя", 
  catalod_id INT UNSIGNED NOT NULL COMMENT "Ссылка на каталог",
  body TEXT NOT NULL COMMENT "Текст рецензии",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  PRIMARY KEY (user_id, catalod_id)
  ) COMMENT "отзывы";



-- Таблица форматов
CREATE TABLE format (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name_format VARCHAR(255) NOT NULL UNIQUE COMMENT "Название ",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "форматы";


show tables;


drop table feedback;