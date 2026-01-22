/* 
   User Access & Segregation of Duties (SoD) Analysis
   
   This script contains SQL queries used to analyze user access data in an enterprise system to identify:
   -Segregation of Duties conflicts
   -Inactive users with system access
   -Dormant users based on last login
   -Users with multiple roles (potential access risk)

   Tables used:
   - users
   - roles
   - user_roles */


/* 
   1. Segregation of Duties (SoD) Conflicts
   Identifies users who have both "Create_Payments" and "Approve_Payments" roles assigned, which represents a classic SoD conflict in financial systems. */

SELECT 
    u.user_id,
    u.username,
    u.department
FROM users u
JOIN user_roles ur1 
    ON u.user_id = ur1.user_id
JOIN roles r1 
    ON ur1.role_id = r1.role_id
JOIN user_roles ur2 
    ON u.user_id = ur2.user_id
JOIN roles r2 
    ON ur2.role_id = r2.role_id
WHERE r1.role_name = 'Create_Payments'
  AND r2.role_name = 'Approve_Payments';


/* Inactive Users with Active System Access: Identifies users who are marked as inactive but still  retain one or more system roles, indicating a potential 
access lifecycle control gap. */

SELECT 
    u.user_id,
    u.username,
    u.status,
    r.role_name
FROM users u
JOIN user_roles ur 
    ON u.user_id = ur.user_id
JOIN roles r 
    ON ur.role_id = r.role_id
WHERE u.status = 'Inactive';


/* Dormant Users (No Login Activity in 6+ Months)
   Identifies users who have not logged into the system for
   more than six months. These accounts may represent
   dormant or unused access that should be reviewed. */

SELECT 
    user_id,
    username,
    last_login
FROM users
WHERE last_login < CURRENT_DATE - INTERVAL '6 months';


/* Users with Multiple Role Assignments
   Identifies users who have been assigned more than one
   system role. Multiple roles can increase access risk
   depending on the nature of the roles assigned. */

SELECT 
    u.user_id,
    u.username,
    COUNT(ur.role_id) AS role_count
FROM users u
JOIN user_roles ur 
    ON u.user_id = ur.user_id
GROUP BY 
    u.user_id,
    u.username
HAVING COUNT(ur.role_id) > 1;


