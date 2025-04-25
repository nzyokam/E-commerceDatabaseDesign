-- Table: brand
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: product_category
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: product
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    brand_id INT,
    category_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- Table: product_image
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    alt_text VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Table: color
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: size_category
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: size_option
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    label VARCHAR(10) NOT NULL,
    value VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- Table: product_item
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    sku VARCHAR(100) NOT NULL UNIQUE,
    stock_quantity INT NOT NULL,
    price DECIMAL(10,2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Table: product_variation
CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_item_id INT NOT NULL,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_item_id) REFERENCES product_item(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

-- Table: attribute_category
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Table: attribute_type
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    data_type VARCHAR(50) NOT NULL -- e.g., text, number, boolean
);

-- Table: product_attribute
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_category_id INT,
    attribute_type_id INT,
    name VARCHAR(100) NOT NULL,
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);
