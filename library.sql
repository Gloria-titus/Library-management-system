CREATE DATABASE library;
USE library;

-- Authors table --
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
    );

-- Publishers table
CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(200),
    phone VARCHAR(20),
    email VARCHAR(100),
    website VARCHAR(100)
);

-- Books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,    
    publication_year INT,    
    publisher_id INT,
    category VARCHAR(50),
    available_copies INT DEFAULT 1,
    total_copies INT DEFAULT 1,
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id) ON DELETE SET NULL
);

-- Book-Author relationship (many-to-many)
CREATE TABLE book_authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

-- Borrowing records table
CREATE TABLE borrowing_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    fine_amount DECIMAL(10,2) DEFAULT 0.00,
    status ENUM('borrowed', 'returned', 'overdue') DEFAULT 'borrowed',
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
    );

-- Sample data insertion

-- Insert authors
INSERT INTO authors (first_name, last_name) VALUES
('George', 'Orwell'),
('Jane', 'Austen'),
('Mark', 'Twain'),
('Chinua', 'Achebe');

-- Insert publishers
INSERT INTO publishers (name, address, phone, email, website) VALUES
('Penguin Books', '80 Strand, London', '123-456-7890', 'info@penguin.com', 'https://penguin.com'),
('Vintage Books', '1745 Broadway, New York', '234-567-8901', 'contact@vintage.com', 'https://vintagebooks.com');

-- Insert books
INSERT INTO books (title, publication_year, publisher_id, category, available_copies, total_copies) VALUES
('1984', 1949, 1, 'Dystopian', 3, 5),
('Pride and Prejudice', 1813, 1, 'Romance', 2, 4),
('Adventures of Huckleberry Finn', 1884, 2, 'Adventure', 1, 3),
('Things Fall Apart', 1958, 2, 'Historical Fiction', 4, 4);

-- Insert book_authors
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1), -- 1984 by George Orwell
(2, 2), -- Pride and Prejudice by Jane Austen
(3, 3), -- Huck Finn by Mark Twain
(4, 4); -- Things Fall Apart by Chinua Achebe

-- Insert borrowing records
INSERT INTO borrowing_records (book_id, borrow_date, due_date, return_date, fine_amount, status) VALUES
(1, '2025-04-01', '2025-04-15', '2025-04-14', 0.00, 'returned'),
(2, '2025-04-10', '2025-04-24', NULL, 0.00, 'borrowed'),
(3, '2025-03-15', '2025-03-29', '2025-04-05', 5.00, 'returned'),
(4, '2025-04-20', '2025-05-04', NULL, 0.00, 'borrowed');
