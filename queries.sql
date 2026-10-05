-- Книги с авторами
SELECT b.title, a.name, b.year
FROM books b JOIN authors a ON b.author_id = a.id;

-- Книги на руках
SELECT b.title, r.name, l.taken
FROM loans l
JOIN books b ON l.book_id = b.id
JOIN readers r ON l.reader_id = r.id
WHERE l.returned IS NULL;

-- Топ читателей
SELECT r.name, COUNT(*) AS books_taken
FROM loans l JOIN readers r ON l.reader_id = r.id
GROUP BY r.id ORDER BY books_taken DESC;

-- Популярные жанры
SELECT genre, COUNT(*) FROM books GROUP BY genre ORDER BY 2 DESC;
