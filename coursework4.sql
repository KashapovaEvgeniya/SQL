-- Пользователи, у которых годовая подписка
SELECT users.id, users.first_name, users.last_name, subscription.name
  FROM users
    JOIN profiles
      ON users.id = profiles.user_id
    join   subscription
      on profiles.subscription_id = subscription.id
    WHERE subscription.name = 12;
  
-- Фильмы с жанром комедия     
 SELECT catalog.id, catalog.name, genre.name_genre
  FROM catalog
    JOIN genre
      ON catalog.genre_id = genre.id
  WHERE  genre.name_genre = 'comedy';    
  
-- Фильмы с рейтингом больше 8 и формат HD
SELECT DISTINCT catalog.id, catalog.name, rating.average_rating, format.name_format
  FROM catalog
    JOIN rating
      ON catalog.rating_id = rating.id
    JOIN format
    JOIN video 
      ON video.format_id = format.id
  WHERE  format.name_format = 'HD' and rating.average_rating  >=8; 
  
-- Фильмы отсоритрованные по годам
CREATE VIEW catalog_1 (id, name, country_creation, year_creation)
   AS SELECT id, name, country_creation, year_creation FROM catalog ORDER BY year_creation;
   
SELECT * FROM catalog_1;   


-- Только мультфильмы
CREATE VIEW mult (id, name, type_id)
  AS SELECT id, name, type_id FROM catalog WHERE type_id = 3;
  
SELECT * FROM mult;   

  
 
      
  
 