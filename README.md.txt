# Fraud Detection System with SQL Server | SQL Server ile Fraud Tespit Sistemi 

Bu proje, **Microsoft SQL Server kullanarak otomatik fraud tespit eden bir sistemdir**.  
Gerçek zamanlı fraud skorları hesaplar, şüpheli işlemleri tespit eder ve SQL raporları oluşturur.  

This project is an **automated fraud detection system using Microsoft SQL Server**.  
It calculates real-time fraud scores, detects suspicious transactions, and generates SQL reports.  

---

## Features | Özellikler
✔ **Fraud Scoring:** Her işleme **risk puanı** (fraud_score) verir.  
✔ **Automated Alerts:** Şüpheli işlemleri **fraud_alerts** tablosuna kaydeder.  
✔ **SQL Server Agent Integration:** Fraud tespiti için **otomatik çalışan job'lar** içerir.  
✔ **Risk Analysis Reports:** Kullanıcılar, IP adresleri ve ülkeler bazında **fraud raporları oluşturur.**  

✔ **Fraud Skorlama:** Assigns a **risk score** (fraud_score) to each transaction.  
✔ **Otomatik Uyarılar:** Stores suspicious transactions in **fraud_alerts** table.  
✔ **SQL Server Agent Entegrasyonu:** Includes **automated jobs for fraud detection**.  
✔ **Risk Analizi Raporları:** Generates **fraud reports by users, IP addresses, and countries**.  

---

## Project Files | Proje Dosyaları

**Database Schema | Veritabanı Şeması** → `schema.sql`  
**Fraud Scoring SQL Script | Fraud Skorlama SQL Komutları** → `fraud_scoring.sql`  
**Fraud Analysis Reports | Fraud Analiz Raporları** → `fraud_reports.sql`  
**Project Documentation | Proje Açıklamaları** → `README.md`  

---

## How to Run | Nasıl Çalıştırılır?

 **Download and Import Database Schema | Veritabanı Şemasını İndirin ve Yükleyin**
```sql
USE FraudDetectionDB;
GO

Run Fraud Scoring Script | Fraud Skorlama Komutlarını Çalıştırın

EXEC DetectFraud;
GO

View Fraud Reports | Fraud Raporlarını Görüntüleyin

SELECT * FROM fraud_alerts;
GO

