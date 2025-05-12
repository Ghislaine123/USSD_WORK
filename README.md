
Mobile Money (MOMO) USSD Application


Project Setup Instructions
---------------------------

This document provides the necessary steps to set up and run the Mobile Money (MOMO) USSD Application.


1. Prerequisites

- PHP 7.0 or higher
- MySQL/MariaDB
- Apache or Nginx web server
- Composer
- Ngrok (for public USSD callback testing)
- Africa’s Talking account with API credentials


2. Installation Steps


Step 1: Clone the Repository
----------------------------
📋 git clone [repository-url]
📋 cd project-directory

Step 2: Install Dependencies
----------------------------
📋 composer install

Step 3: Setup the Database
--------------------------
- Create a new MySQL database.
- Import the SQL schema provided in the `/database` directory.

Step 4: Configure Database Connection
-------------------------------------
Edit the `Util.php` file with your database credentials:

📋 const HOST = "localhost";
📋 const DBNAME = "momo";
📋 const USERNAME = "root";
📋 const PASSWORD = "";

Step 5: Configure Africa’s Talking SMS API
------------------------------------------
Edit the `sms.php` file with your API credentials:

📋 $this->AT = new AfricasTalking("sandbox", "your-api-key");

Step 6: Admin Panel Setup
-------------------------
- Admin panel URL: `/admin`
- Default login credentials:

  📋 Username: admin
  📋 Password: admin123

⚠️ Important: Change these credentials in production.


3. USSD Integration with Ngrok


Step 1: Start Local Server
--------------------------
- Launch Apache and MySQL services using XAMPP or similar.

Step 2: Start Ngrok
-------------------
📋 ngrok http 8000

Step 3: Copy the HTTPS forwarding URL from Ngrok
------------------------------------------------
Example: https://abc123.ngrok.io

Step 4: Set Africa's Talking Callback URL
-----------------------------------------
In your Africa’s Talking sandbox, set the USSD callback URL to:

📋 https://abc123.ngrok.io/index.php

