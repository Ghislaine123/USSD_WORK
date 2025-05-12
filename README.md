Mobile Money (MOMO) USSD Application

Project Overview

This USSD-based Mobile Money application allows users to:

- Register and manage accounts
- Send money to other users
- Withdraw money through agents
- Check balances

Agents can:

- Approve withdrawal requests
- Check their balances
- View transaction history

Developers:
- Gikundiro Ange Ghislaine
- URUJENI SHALLON

Features:

User Features:
- Registration with phone number and PIN
- Send money to other users
- Withdraw money through agents
- Check account balance

Agent Features:
- Approve withdrawal requests
- Check agent balance
- View transaction history

Admin Features:
- Register new agents
- Update agent balances
- View all registered agents

Setup Instructions

Prerequisites:
- PHP 7.0 or higher
- MySQL/MariaDB
- Apache or Nginx web server
- Composer
- Ngrok (for public USSD callback testing)
- Africa’s Talking account and API credentials

Installation Steps:

1. Clone the repository:
   Run the following command to clone the repository:

   📋 git clone [repository-url]
   📋 cd project-directory

2. Install dependencies:
   Run the following command to install project dependencies:

   📋 composer install

3. Setup the database:
   - Create a new MySQL database
   - Import the SQL schema provided in the /database directory

4. Configure the database connection:
   Edit the Util.php file and set your DB credentials:

   📋 const HOST = "localhost";
   📋 const DBNAME = "momo";
   📋 const USERNAME = "root";
   📋 const PASSWORD = "";

5. Configure Africa's Talking API:
   Edit sms.php:

   📋 $this->AT = new AfricasTalking("sandbox", "your-api-key");

6. Setup Admin Panel:
   - Admin panel is accessible at: /admin
   - Default login credentials:
     - 📋 Username: admin
     - 📋 Password: admin123

     ⚠️ Change these credentials in production.

USSD Integration with Ngrok:

1. Start your XAMPP SERVICES FOR APACHE AND MYSQL locally:

2. Start ngrok to expose your server:
   📋 ngrok http 8000

3. Copy the HTTPS forwarding URL from ngrok (e.g., https://abc123.ngrok.io)

4. Set the callback URL in Africa’s Talking USSD sandbox to:

   📋 https://abc123.ngrok.io/index.php
