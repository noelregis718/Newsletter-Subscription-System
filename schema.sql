use sql12373655;
CREATE TABLE users
(
	u_id int not null primary key auto_increment,
    email  VARCHAR(255) not null unique,
    name  VARCHAR(255) not null,
    password varchar(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE newsletters ( 
   n_id int PRIMARY KEY AUTO_INCREMENT, 
   n_name varchar(50),
   description text
);

CREATE TABLE subscriber( 
   s_id int PRIMARY KEY AUTO_INCREMENT, 
   user_id int references users.id,
   news_id int references newsletter.id,
   UNIQUE KEY (user_id,news_id)
);

-- Base condidtion for admin which can only accessed by admin
INSERT INTO users (email,password,name) VALUES('admin','admin','admin');
-- Can be entered manually or on webpage
INSERT INTO users (email,password,name) VALUES('a@abcd','abcd','a');
INSERT INTO users (email,password,name) VALUES('b@abcd','abcd','b');
INSERT INTO newsletters (n_name,description) VALUES('nl1','this is nl1'), ('nl2','this is nl2');
INSERT INTO subscriber (user_id,news_id) VALUES(2,1), (3,2),(3,1);



-- queries used
select * from users;
select * from newsletters;
select * from subscriber;
-- SELECT COUNT(*) AS count FROM users;
-- SELECT * FROM users WHERE email = ? AND password = ?;
-- SELECT * FROM users where email=?;
-- SELECT * FROM newsletters ORDER BY name;
-- Select * from newsletters  join (Select * from users join subscriber on users.u_id = subscriber.user_id )as us on newsletters.n_id=us.news_id where email=?;
-- SELECT * FROM users where not email = "admin";
-- Select *,count(news_id) as c from newsletters  left join (Select * from users join subscriber on users.u_id = subscriber.user_id )as us on newsletters.n_id=us.news_id group by n_id;
-- delete from subscriber where user_id =? and news_id= ?;
-- SELECT * FROM users where not email='admin' ORDER BY created_at desc ;
-- INSERT INTO newsletters (name) VALUES ('...');
-- INSERT INTO subscriber (user_id,news_id) VALUES ("userid","req.body.id2");
-- INSERT INTO users (email,password) values('req.body.email','req.body.password');