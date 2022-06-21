DROP TABLE IF EXISTS image;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS place;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    user_id BINARY(16) NOT NULL PRIMARY KEY,
    email   VARCHAR(255) NOT NULL,
    point   BIGINT
);

CREATE TABLE place
(
    place_id BINARY(16) NOT NULL PRIMARY KEY
);

CREATE TABLE review
(
    review_id   BINARY(16) NOT NULL PRIMARY KEY,
    content     VARCHAR(255),
    given_point BIGINT NOT NULL,
    place_id    BINARY(16) NOT NULL,
    user_id     BINARY(16) NOT NULL,
    FOREIGN KEY (place_id) REFERENCES place (place_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE image
(
    image_id  BINARY(16) NOT NULL PRIMARY KEY,
    review_id BINARY(16) NOT NULL,
    FOREIGN KEY (review_id) REFERENCES review (review_id)
);