INSERT INTO users VALUES
(1, 'jsmith', 'Finance', 'Active', '2025-04-10'),
(2, 'adoe', 'Finance', 'Active', '2024-11-02'),
(3, 'bwilliams', 'IT', 'Inactive', '2023-12-15'),
(4, 'kpatel', 'Operations', 'Active', '2025-05-01');

INSERT INTO roles VALUES
(1, 'Create_Payments'),
(2, 'Approve_Payments'),
(3, 'System_Admin'),
(4, 'View_Reports');

INSERT INTO user_roles VALUES
(1, 1, '2024-01-01'),
(1, 2, '2024-01-01'), -- SoD conflict
(2, 4, '2024-06-10'),
(3, 3, '2022-03-01'),
(4, 1, '2025-02-15');
