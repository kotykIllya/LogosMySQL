USE library;

CREATE TABLE IF NOT EXISTS book (
    book_id INT NOT NULL AUTO_INCREMENT,
    book_name VARCHAR(50),
    book_description TEXT,
    price INT,
    isbn INT,
    PRIMARY KEY (book_id)
);

CREATE TABLE IF NOT EXISTS genre (
    genre_id INT NOT NULL AUTO_INCREMENT,
    genre_name VARCHAR(50),
    book_id INT,
    PRIMARY KEY (genre_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE IF NOT EXISTS author (
    author_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    adres TEXT,
    birth_date DATE,
    PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS Author_Book (
    author_id INT NOT NULL,
    book_id INT NOT NULL,
    CONSTRAINT id PRIMARY KEY (author_id, book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
)



