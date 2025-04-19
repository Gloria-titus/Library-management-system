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

-- Sample data for authors
INSERT INTO authors (first_name, last_name) VALUES
('George', 'Orwell'),
('J.K.', 'Rowling'),
('Stephen', 'King');

-- Sample data for publishers
INSERT INTO publishers (name, address, phone, email, website) VALUES
('Penguin Books', '80 Strand, London, UK', '+44 20 7010 3000', 'info@penguin.co.uk', 'www.penguin.co.uk'),
('Scholastic', '557 Broadway, New York, NY, USA', '+1 212 343-6100', 'info@scholastic.com', 'www.scholastic.com'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY, USA', '+1 212 698-7000', 'info@simonandschuster.com', 'www.simonandschuster.com');

-- Sample data for books
INSERT INTO books (title,publication_year,publisher_id, category,available_copies, total_copies) VALUES
('1984', 1949,1, 'Dystopian',3, 5),
('Harry Potter and the Philosopher''s Stone',1997, 2, 'Fantasy', 2, 4),
('The Shining', 1977, 3, 'Horror',1, 3);

-- Sample data for book_authors
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Sample data for borrowing_records
INSERT INTO borrowing_records (book_id,borrow_date, due_date, return_date, fine_amount, status) VALUES
(1, '2023-04-01', '2023-04-15', '2023-04-14', 0.00, 'returned'),
(2, '2023-04-05', '2023-04-19', NULL, 5.50, 'overdue'),
(3, '2023-04-10', '2023-04-24', NULL, 0.00, 'borrowed');




