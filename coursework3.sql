use ivi;
desc video;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;  
      
ALTER TABLE profiles
  ADD CONSTRAINT profiles_subscription_id_fk 
    FOREIGN KEY (subscription_id) REFERENCES subscription(id);
      
ALTER TABLE catalog 
  ADD CONSTRAINT catalog_genre_id_fk 
    FOREIGN KEY (genre_id) REFERENCES genre(id); 
    
ALTER TABLE catalog 
  ADD CONSTRAINT catalog_type_id_fk 
    FOREIGN KEY (type_id) REFERENCES type(id);   
    
ALTER TABLE catalog 
  ADD CONSTRAINT catalog_rating_id_fk 
    FOREIGN KEY (rating_id) REFERENCES rating(id);  
    
ALTER TABLE feedback 
  ADD CONSTRAINT feedback_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);  
    
ALTER TABLE feedback 
  ADD CONSTRAINT feedback_catalog_id_fk 
    FOREIGN KEY (catalod_id) REFERENCES catalog(id);   
    
ALTER TABLE reviews 
  ADD CONSTRAINT reviews_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);  
    
ALTER TABLE reviews 
  ADD CONSTRAINT reviews_catalog_id_fk 
    FOREIGN KEY (catalod_id) REFERENCES catalog(id);       
    
 CREATE INDEX catalog_country_creation ON catalog(country_creation);   
 CREATE INDEX rating_average_rating_idx ON rating(average_rating);


    
    
    
    
    
    