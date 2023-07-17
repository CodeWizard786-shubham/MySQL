# DCl commands
use bridgelabs;
CREATE USER 'shubham'@'localhost' IDENTIFIED BY 'shubham';

GRANT INSERT, UPDATE,select ON cfp_bl TO 'shubham'@'localhost';


REVOKE select ON cfp_bl FROM 'shubham'@'localhost';

commit;

