use ivi;
-- процедура которая принмает id пользователя и выдает количество отзывов

DROP PROCEDURE counts_reviews;
DELIMITER //
CREATE PROCEDURE counts_reviews (IN id INT)
BEGIN
  SELECT COUNT(id) FROM reviews WHERE user_id = id;
END//
DELIMITER ;

-- вызов процедуры
CALL counts_reviews(7);


-- проверяем если при вставке в таблицу рейтинг, рейтинг до 10 

DELIMITER //
CREATE TRIGGER check_rating BEFORE INSERT ON rating
FOR EACH ROW
BEGIN
  IF NEW.average_rating > 10  THEN 
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Рейтинг можно ставить до 10';
  END IF;
END//

SELECT * FROM rating;
-- проверка
INSERT INTO rating
  (id, average_rating, directing_rating, story_rating, entertainment_rating, actors_rating)
VALUES
  (101, 7,5,7,2,6)//
  
-- колличество по типам и жанрам 
SELECT  DISTINCT
   count(catalog.id) OVER(PARTITION BY catalog.type_id ORDER BY type.id) AS total_type,
   count(catalog.id) OVER(PARTITION BY catalog.genre_id ORDER BY genre.id ) AS total_genre
      FROM catalog
      JOIN type
        ON catalog.type_id = type.id
      JOIN genre
       ON catalog.genre_id = genre.id;  