SELECT u.user_id, u.username
FROM users u
JOIN user_roles ur1 ON u.user_id = ur1.user_id
JOIN roles r1 ON ur1.role_id = r1.role_id
JOIN user_roles ur2 ON u.user_id = ur2.user_id
JOIN roles r2 ON ur2.role_id = r2.role_id
WHERE r1.role_name = 'Create_Payments'
  AND r2.role_name = 'Approve_Payments';
