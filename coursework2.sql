use ivi;

show tables;

select * from catalog;

UPDATE catalog SET updated_at = NOW() WHERE updated_at < created_at;  

UPDATE catalog SET
  genre_id = FLOOR(1 + RAND() * 10),
  type_id = FLOOR(1 + RAND() * 3),
  rating_id = FLOOR(1 + RAND() * 100);
  
 select * from feedback; 
 
 UPDATE feedback SET
  catalod_id = FLOOR(1 + RAND() * 100);
  
select * from format;  

UPDATE format SET updated_at = NOW() WHERE updated_at < created_at; 

select * from genre;

 select * from profiles;   
 
 UPDATE profiles SET gender = 'w' WHERE gender = " ";
 
 UPDATE profiles SET
  subscription_id = FLOOR(1 + RAND() * 5);
  
 select * from rating;  
 
 UPDATE rating SET
  average_rating = FLOOR(1 + RAND() * 10),
  directing_rating = FLOOR(1 + RAND() * 10),
  story_rating = FLOOR(1 + RAND() * 10),
  entertainment_rating = FLOOR(1 + RAND() * 10),
  actors_rating = FLOOR(1 + RAND() * 10);
 
 
 select * from reviews;
 
 UPDATE reviews SET updated_at = NOW() WHERE updated_at < created_at; 
 
 UPDATE reviews SET
  catalod_id = FLOOR(1 + RAND() * 100);
  
select * from subscription;
   
select * from type;

select * from users;

UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;

 select * from video;
 
UPDATE video SET updated_at = NOW() WHERE updated_at < created_at; 

UPDATE video SET
  reviews_id = FLOOR(1 + RAND() * 50),
  feedback_id = FLOOR(1 + RAND() * 50);
   
   
 
 