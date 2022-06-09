USE library;

CREATE TABLE book2(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_of_book VARCHAR(120) NOT NULL,
    description_of_book TEXT,
    date_publication DATE DEFAULT '2018-01-01',
    category VARCHAR(30) NOT NULL,
    isbn VARCHAR(30) NOT NULL UNIQUE,
    amount_of_pages INT NOT NULL,
    author_first_name VARCHAR(45) NOT NULL,
    author_last_name VARCHAR(45) NOT NULL,
    author_email VARCHAR(50) NOT NULL UNIQUE,
    author_age INT NOT NULL,
    author_birth DATE NOT NULL,
    author_prizes VARCHAR(120) DEFAULT NULL
);

INSERT INTO book2 (name_of_book, description_of_book, date_publication, category,
                   isbn, amount_of_pages, author_first_name, author_last_name,
                   author_email, author_age, author_birth, author_prizes)
VALUES
    ('Енеїда', 'Берлескно-травесійна поема', '1842-05-03', 'поема', 1487, 254, 'Іван','Котляревський',
     'kotlyarevsky@gmail.com', 75, '1798-04-26', 'International prize'),
    ('Камінний Хрест', 'Опис', '1900-09-15', 'психологічна новела', 2222, 84, 'Василь','Стефаник',
     'stefanyk@gmail.com', 68, '1879-05-26', 'Ukrainian prize'),
    ('Мартин Боруля', 'Опис', '1899-06-30', 'трагікомедія', 1115, 140, 'Іван','Кврпенко-Карий',
     'ivanKR@gmail.com', 57, '1885-07-04', 'Ukrainian prize'),
    ('Тіні забутих предків', 'Опис', '1906-11-11', 'повість', 1484, 240, 'Михайло','Коцюбинський',
     'kotsibynskiy@gmail.com', 74, '1874-10-12', 'Ukrainian prize'),
    ('Біле Ікло', 'White Fang', '1842-07-04', 'роман', 1458, 540, 'Джек','Лондон',
     'london@gmail.com', 77, '1780-09-11', 'English prize'),
    ('Фауст', 'Faust', '1836-04-27', 'драма', 4789, 247, 'Йоганн Вольфганг','фон Гете',
     'wolfgang@gmail.com', 85, '1755-09-24', 'International prize'),
    ('Хіба ревуть воли як ясла повні', 'Опис', '1880-01-01', 'роман', 4785, 340, 'Панас','Мирний',
     'myrnyi@gmail.com', 68, '1850-11-18', 'International prize'),
    ('Чорна рада', 'Історичний', '1875-04-05', 'роман', 9898, 740, 'Пантилеймон','Куліш',
     'kulish@gmail.com', 87, '1832-09-26', 'Ukrainian prize'),
    ('Захар Беркут', 'Опис', '1874-08-02', 'повість', 2548, 190, 'Іван','Франко',
     'franko@gmail.com', 54, '1854-07-07', 'Ukrainian prize'),
    ('Тигролови', 'Опис', '1950-05-11', 'роман', 7859, 425, 'Іван','Багряний',
     'bagryanui@gmail.com', 87, '1923-09-26', 'International prize');

SELECT * FROM book2;

SELECT * FROM book2 WHERE id = 5 OR id = 10 OR id = 13;

SELECT * FROM book2 WHERE amount_of_pages > 150;

SELECT * FROM book2 WHERE author_age > 30;

SELECT * FROM book2 WHERE author_prizes IS NULL;

SELECT * FROM book2 WHERE author_email = 'myrnyi@gmail.com';

SELECT * FROM book2 WHERE isbn = 9898;

SELECT * FROM book2 WHERE category = 'роман';

SELECT * FROM book2 WHERE amount_of_pages > 200 AND author_age > 25;

SELECT * FROM book2 WHERE category = 'повість' OR category = 'драма';

SELECT * FROM book2 ORDER BY name_of_book;

SELECT * FROM book2 ORDER BY author_email;

SELECT * FROM book2 ORDER BY amount_of_pages DESC;

SELECT DISTINCT category FROM book2;

SELECT DISTINCT author_first_name FROM book2;

SELECT * FROM book2 WHERE date_publication > '1898-01-01';

SELECT * FROM book2 WHERE date_publication < '1888-01-01';
