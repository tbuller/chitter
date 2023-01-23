TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (username, password) VALUES ('Timmy B', 'testing123');
INSERT INTO users (username, password) VALUES ('Timmy C', 'password1');
INSERT INTO users (username, password) VALUES ('Timmy D', 'password2');
INSERT INTO users (username, password) VALUES ('Michael Jordan', 'baseball123');
INSERT INTO users (username, password) VALUES ('Steven Gerrard', 'Liverpool123');
INSERT INTO users (username, password) VALUES ('Johnno', 'hw123');
INSERT INTO users (username, password) VALUES ('Emil', 'backenddev123');

INSERT INTO posts (title, content, time, user_id) VALUES ('rant', 'baseball is better than basketball', '08:00:00', 4);
INSERT INTO posts (title, content, time, user_id) VALUES ('my morning', 'nothing to report so far', '08:00:00', 1);
INSERT INTO posts (title, content, time, user_id) VALUES ('my morning', 'nothing to report so far, had a lie in', '10:00:00', 2);
INSERT INTO posts (title, content, time, user_id) VALUES ('my morning', 'early bird get the worm', '06:00:00', 3);
INSERT INTO posts (title, content, time, user_id) VALUES ('retirement update', 'coming out of retirement to join the Chicago Bulls', '11:30:00', 4);
INSERT INTO posts (title, content, time, user_id) VALUES ('heading down to the pub', 'anyone up for a game of pool?', '18:45:00', 6);