CREATE TABLE Users (
  uid SERIAL UNIQUE,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE Posts (
  pid SERIAL UNIQUE,
  uid INT,
  FOREIGN KEY (uid) REFERENCES Users(uid),
  content VARCHAR(255) NOT NULL UNIQUE,
  timestamp BIGINT NOT NULL
);

CREATE TABLE Follows (
  follower_id INT,
  followee_id INT,
  FOREIGN KEY (follower_id) REFERENCES Users(uid),
  FOREIGN KEY (followee_id) REFERENCES Users(uid),
  PRIMARY KEY(follower_id,followee_id)
);

CREATE TABLE Blocks (
  blocker_id INT,
  blockee_id INT,
  FOREIGN KEY (blocker_id) REFERENCES Users(uid),
  FOREIGN KEY (blockee_id) REFERENCES Users(uid),
  PRIMARY KEY(blocker_id,blockee_id)
);

CREATE TABLE Replies (
  rid SERIAL UNIQUE,
  uid INT,
  pid INT,
  FOREIGN KEY (uid) REFERENCES Users(uid),
  FOREIGN KEY (pid) REFERENCES Posts(pid),
  content VARCHAR(255) NOT NULL UNIQUE,
  timestamp BIGINT NOT NUll
);

CREATE TABLE Shares (
  sid SERIAL UNIQUE,
  uid INT,
  pid INT,
  FOREIGN KEY (uid) REFERENCES Users(uid),
  FOREIGN KEY (pid) REFERENCES Posts(pid),
  timestamp BIGINT NOT NUll
);

CREATE TABLE Like (
  uid INT,
  pid INT,
  FOREIGN KEY (uid) REFERENCES Users(uid),
  FOREIGN KEY (pid) REFERENCES Posts(pid),
  timestamp BIGINT NOT NUll,
  PRIMARY KEY(uid,pid)

);

CREATE TABLE Unlike (
  uid INT,
  pid INT,
  FOREIGN KEY (uid) REFERENCES Users(uid),
  FOREIGN KEY (pid) REFERENCES Posts(pid),
  timestamp BIGINT NOT NULL,
  PRIMARY KEY(uid,pid)

);
