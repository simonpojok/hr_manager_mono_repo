# HR Manager API Documentation

This project is a **Django**-based backend API for managing staff registrations, network request logging, and statistics. The backend is currently deployed on **Render** and can be accessed using the links provided below.

## Deployment Guide

To deploy the Django project, follow these steps and ensure the environment variables are configured correctly:

### Required Environment Variables

- **`DEBUG`**: Set to `False` in production to disable debug mode.
- **`DATABASE_URL`**: The database connection string for the production database.
- **`SECRET_KEY`**: A unique secret key for cryptographic signing in Django.
- **`ALLOWED_HOSTS`**: The allowed domains/hosts that can serve your application (e.g., `['yourdomain.com', 'localhost']`).
- **`CORS_ALLOWED_ORIGINS`**: A list of allowed origins to handle cross-origin resource sharing (CORS).

The backend is deployed on **Render** and can be accessed from this URL: [https://hr-manager-mono-repo.onrender.com](https://hr-manager-mono-repo.onrender.com).

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
