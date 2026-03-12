# Automated Jenkins Job Triggered by Access Log Size

## 📌 Project Overview
This project automates log monitoring on a Linux server. When the Apache access log file grows beyond a specified size limit (e.g., 1GB), a Jenkins job is automatically triggered to upload the log file to AWS S3 and clear the log to prevent disk space issues.

This helps maintain server stability and prevents storage overflow caused by continuously growing log files.

---

## ⚙️ Technologies Used

- Linux (Ubuntu)
- Shell Scripting (Bash)
- Jenkins
- AWS S3
- Cron Jobs
- Apache Web Server
- Git & GitHub

---

## 🏗️ Architecture Workflow

1. Apache generates access logs continuously.
2. A shell script monitors the log file size.
3. If the log size exceeds the defined threshold (e.g., 1GB), the script triggers a Jenkins job.
4. Jenkins uploads the log file to AWS S3.
5. After uploading, the log file is cleared.
6. The monitoring script runs automatically every 5 minutes using Cron.

---

## 📁 Project Structure
jenkins-app
│
├── monitor_log.sh
├── check_log_size.sh
├── log_monitor.log
├── .gitignore
└── README.md


---

## 🚀 Setup Steps

### 1️⃣ Install Apache

```bash
sudo apt update
sudo apt install apache2
2️⃣ Install Jenkins

Follow Jenkins installation steps from official documentation.

3️⃣ Create Jenkins Job

Create a Jenkins job that uploads log files to AWS S3.

4️⃣ Configure AWS CLI
aws configure

Provide:

AWS Access Key

Secret Key

Region

5️⃣ Run Log Monitoring Script
chmod +x monitor_log.sh
./monitor_log.sh
6️⃣ Setup Cron Job

Edit crontab:

crontab -e

Add:

*/5 * * * * /home/ubuntu/jenkins-app/monitor_log.sh

This runs the script every 5 minutes.

🔒 Security Best Practices

Sensitive data such as AWS credentials and API keys should not be stored in the repository. They should be managed securely using Jenkins Credentials Manager.

📊 Use Case

This automation is useful in production environments where log files grow rapidly and can cause server disk space issues.
