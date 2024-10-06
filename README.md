
# HR Manager API Documentation

This repository is a **monorepo** containing multiple projects that work together to manage staff, monitor network requests, and provide a mobile interface for creating and managing staff records.
This project is a **Django**-based backend API for managing staff registrations, network request logging, and statistics. The backend is currently deployed on **Render** and can be accessed using the links provided below.

## Deployment Guide

Follow the steps below to deploy the **HR Manager** Django backend.

### 1. Clone the Repository

Start by cloning the repository to your local machine:

```bash
git clone https://github.com/your-username/hr-manager.git
cd hr-manager/hr_manager
```
## Project Structure

1. **Folder: `hr_manager`**  
   This folder contains the **Django** project, which serves as the **backend** of the application. It provides APIs for staff registration and network logging.  
   - The backend can be accessed here: [https://hr-manager-mono-repo.onrender.com/](https://hr-manager-mono-repo.onrender.com/)
   
2. **Folder: `hr_mobi`**  
   This folder contains a **Flutter** mobile application that consumes the backend API provided by `hr_manager`. The mobile app allows users to create and manage staff records.
   - **Unique Code Requirement**: To create a new staff member using the mobile app, a **unique code** is required. You can generate this unique code from the backend API here: [https://hr-manager-mono-repo.onrender.com/](https://hr-manager-mono-repo.onrender.com/).
   - The combined API documentation for the mobile app is located under the **assets** folder in this repository.

3. **Folder: `hr_network_monitor`**  
   This folder contains a **React Next.js** application that displays network call statistics. The dashboard shows logs of API requests made to the backend and various statistics about network performance.  
   - The network monitoring dashboard can be accessed here: [https://hr-manager-network-monitor.onrender.com/dashboard](https://hr-manager-network-monitor.onrender.com/dashboard).
   - **Login Credentials**: To access the dashboard, use the following credentials:
     - **Username**: `admin1`
     - **Password**: `@staff4y2024`
     - **Username**: `admin2`
     - **Password**: `@staff4y2024`
     - **Username**: `admin3`
     - **Password**: `@staff4y2024`

### 2. Set Up the Environment Variables

Create a file named `.env` in the root of the `hr_manager` folder by copying the contents of the `.env.example` file and filling in the missing information:

```bash
cp .env.example .env
```

In the `.env` file, set the following variables:

```bash
DEBUG=False
SECRET_KEY=your-secret-key
ALLOWED_HOSTS=yourdomain.com, localhost

DATABASE_URL=your-database-url

EMAIL_HOST=smtp.example.com
EMAIL_PORT=587
EMAIL_USE_TLS=True
EMAIL_HOST_USER=your-email@example.com
EMAIL_HOST_PASSWORD=your-email-password

CORS_ALLOWED_ORIGINS=https://yourfrontenddomain.com

CSRF_COOKIE_SECURE=True
SESSION_COOKIE_SECURE=True
SECURE_SSL_REDIRECT=True
X_FRAME_OPTIONS='DENY'
```

- **`DEBUG`**: Set to `False` for production.
- **`SECRET_KEY`**: Set this to a unique secret key for your Django application.
- **`ALLOWED_HOSTS`**: Add the domain names or IP addresses that are allowed to connect to your app.
- **`DATABASE_URL`**: The connection string to your database.
- **`EMAIL_HOST`, `EMAIL_PORT`, `EMAIL_USE_TLS`, `EMAIL_HOST_USER`, `EMAIL_HOST_PASSWORD`**: Configure your email settings for sending email notifications.
- **`CORS_ALLOWED_ORIGINS`**: List of allowed origins for cross-origin requests.
- **Security Settings**:
  - **`CSRF_COOKIE_SECURE`**: Ensures CSRF cookies are sent over HTTPS.
  - **`SESSION_COOKIE_SECURE`**: Ensures session cookies are sent over HTTPS.
  - **`SECURE_SSL_REDIRECT`**: Redirects all HTTP requests to HTTPS.
  - **`X_FRAME_OPTIONS`**: Prevents the site from being framed, set to `'DENY'`.

### 3. Install Dependencies

Install the required dependencies using `pip`:

```bash
pip install -r requirements.txt
```

### 4. Run the Project Using Gunicorn

Once the environment is set up and the dependencies are installed, run the project using **Gunicorn**:

```bash
gunicorn hr_manager.wsgi --bind 0.0.0.0:8000
```

This will start the Django application on port 8000. You can change the port or other Gunicorn options as needed.

---

## API Endpoints

This API has the following available endpoints (with success status codes). Detailed documentation based on the Postman collection is attached.

### Staff Registration

- **Endpoint**: `/api/staff/register/`
- **Method**: `POST`
- **Description**: Register a new staff member using a unique code.

### Network Logs

- **Endpoint**: `/api/network-logs/`
- **Method**: `GET`
- **Description**: View the network statistics, including request counts and request details.

### Request Statistics

- **Endpoint**: `/api/network-logs/stats/`
- **Method**: `GET`
- **Description**: Get statistics of network requests, including successful and failed request counts.

## Steps to Test the Project

1. **Generate a Unique Code**: 
   - Visit [https://hr-manager-mono-repo.onrender.com](https://hr-manager-mono-repo.onrender.com) to generate a unique code.
   - This code is required to create a new staff member using the mobile app.

2. **View Network Statistics**:
   - Visit the dashboard for network monitoring at [https://hr-manager-network-monitor.onrender.com/dashboard](https://hr-manager-network-monitor.onrender.com/dashboard).
   - Use the following credentials to log in:

      - **Username**: `admin1`
      - **Password**: `@staff4y2024`

      - **Username**: `admin2`
      - **Password**: `@staff4y2024`

      - **Username**: `admin3`
      - **Password**: `@staff4y2024`

## Mobile Application

This project includes a **mobile application** that interacts with the API. You can download the APK and use it to test the available endpoints and make requests.

### APK Download

To download the mobile application APK, click the link below:

- [Download APK](#) <!-- Replace with actual link to APK -->

### How to Install APK on Android

1. **Enable Installation from Unknown Sources**:
   - Go to **Settings > Security**.
   - Enable **Unknown Sources** to allow installation of apps from sources other than the Google Play Store.

2. **Download and Install the APK**:
   - Download the APK from the link provided.
   - Open the file, and you will be prompted to install the application.

3. **Launch the App**:
   - Once installed, open the app and you will be able to use it to interact with the API.

### Using the App

1. **Creating a New Staff Member**:
   - Navigate to the "Create Staff" screen, enter the invitation code generated from the API, along with staff details such as name, date of birth, and ID photo.
   - Tap "Create Staff" to submit the request.

2. **Viewing Staff List**:
   - On the "Staffs" screen, you can see the list of registered staff members along with their registration dates.

3. **Updating Staff Details**:
   - Tap on any staff member to view their details and update roles if necessary.

### Screenshots

Below are some screenshots showing how to use the mobile app:

#### Staff List

![Staff List](path_to_screenshot1) <!-- Replace with actual path to screenshot -->

#### Staff Details

![Staff Details](path_to_screenshot2) <!-- Replace with actual path to screenshot -->

#### Create Staff

![Create Staff](path_to_screenshot3) <!-- Replace with actual path to screenshot -->

## Additional Information

- Make sure you have the proper database and CORS settings configured in production.
- Use the provided admin credentials to manage network logs and staff registrations.

For more detailed API usage, refer to the Postman collection attached to this repository.
