# Библиотека

Учёт книг, авторов, читателей и выдач.

## Файлы
- `schema.sql` — структура таблиц
- `seed.sql` — тестовые данные
- `queries.sql` — популярные отчёты
- `books.csv` — импорт книг из CSV

## Запуск
```bash
sqlite3 library.db < schema.sql
sqlite3 library.db < seed.sql
sqlite3 library.db < queries.sql


**schema.sql**
```sql
CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INTEGER,
    year INTEGER,
    genre TEXT,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE readers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    joined DATE
);

CREATE TABLE loans (
    id INTEGER PRIMARY KEY,
    book_id INTEGER,
    reader_id INTEGER,
    taken DATE,
    returned DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (reader_id) REFERENCES readers(id)
);
