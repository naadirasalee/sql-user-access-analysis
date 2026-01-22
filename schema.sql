CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    department VARCHAR(50),
    status VARCHAR(20), -- Active / Inactive
    last_login DATE
);

CREATE TABLE roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50)
);

CREATE TABLE user_roles (
    user_id INT,
    role_id INT,
    assigned_date DATE,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);
