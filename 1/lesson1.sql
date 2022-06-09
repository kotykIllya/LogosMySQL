CREATE DATABASE IF NOT EXISTS library;

USE library;

CREATE TABLE book(
    name VARCHAR(120) NOT NULL,
    description VARCHAR(500) DEFAULT 'Description is absent',
    date_publication DATE DEFAULT '2018-01-01' NOT NULL,
    author VARCHAR(60) NOT NULL,
    category VARCHAR(30) NOT NULL
);

INSERT INTO book (name, description, date_publication, author, category)
VALUES
    ('Енеїда', 'Берлескно-травесійна поема', '1842-05-03', 'Котляревський Іван', 'поема'),
    ('Камінний Хрест', DEFAULT, '1900-09-15', 'Василь Стефаник', 'психологічна новела'),
    ('Мартин Боруля', DEFAULT, '1879-05-03', 'Іван Кврпенко-Карий', 'трагікомедія'),
    ('Тіні забутих предків', 'повість', '1906-05-03', 'Михайло Коцюбинський', 'повість'),
    ('Біле Ікло', 'White Fang', '1842-05-03', 'Джек Лондон', 'роман'),
    ('Фауст', 'Faust', '1836-05-03', 'Йоганн Вольфганг фон Гете', 'драма'),
    ('Хіба ревуть воли як ясла повні', DEFAULT, '1880-05-03', 'Панас Мирний', 'роман'),
    ('Чорна рада', 'Історичний', '1875-05-03', 'Пантилеймон Куліш', 'роман'),
    ('Захар Беркут', DEFAULT, '1874-05-03', 'Іван Франко', 'повість'),
    ('Тигролови', DEFAULT, '1950-05-03', 'Іван Багряний', 'роман');

SELECT * FROM book;








