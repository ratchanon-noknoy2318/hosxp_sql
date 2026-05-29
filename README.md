## 💡 Overview & Clinical Context

This repository houses a production-grade collection of SQL queries built to optimize data extraction, auditing, and reporting within the HOSxP ecosystem. Every script was engineered by translating real-world clinical requirements from frontline nursing and OPD (Outpatient Department) staff into optimized database queries.

---

## 🗂️ Script Catalog

A curated collection of SQL queries handling core hospital information tasks:

- 🔍 **`extract_patient_data.sql`** — Core ETL query for comprehensive patient demographic profiling.
- 🩺 **`extract_patient_visit_daily.sql`** — Tracks daily Outpatient Department (OPD) encounter workflows.
- 💊 **`extract_patient_drug_allergy.sql`** — Fetches patient drug hypersensitivity records for clinical safety.
- 🦷 **`extract_patient_dtx_records.sql`** — Extracted dental informatics records by mapping hidden sub-schemas.
- 🧾 **`extract_patient_billing_by_group.sql`** — Aggregates financial and billing groups for insurance verification.
- 🚨 **`check_patient_data_consistency.sql`** — Runs administrative audit checks to reduce manual data-entry errors.
- 🗺️ **`extract_village_list.sql`** — Maps public health geographical data across local community sectors.
- 💻 **`telemedicine_completed.sql`** — Queries intake logs for completed digital telehealth services.

---

## 📖 Sample Query Architecture

Below is an abstract design pattern demonstrating how data is safely joined across core HOSxP relations (`patient`, `ovst`, `opdscreen`) to feed nursing data pipelines:

```sql
SELECT 
    p.hn,
    CONCAT(p.pname, p.fname, ' ', p.lname) AS patient_name,
    o.vstdate,
    o.vsttime,
    s.bps,
    s.bpd,
    s.pulse
FROM ovst o
LEFT JOIN patient p ON p.hn = o.hn
LEFT JOIN opdscreen s ON s.vn = o.vn
WHERE o.vstdate = CURRENT_DATE
ORDER BY o.vsttime DESC;
```

---

## 🔗 References & Resources

- 🌐 **HOSxP Official Website:** [BMS HOSxP](https://hosxp.net)
- 💼 **Connect with me:** Connect on [LinkedIn](https://www.linkedin.com/posts/ratchanon-noknoy_healthcaredata-dataengineering-systemsthinking-share-7456534276168282112-Bi0a/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF2Q4JEBP4yITEVbIn3E5Y8zTBxoVS6vqRA) for engineering analysis and updates.

---

## 📄 License

⚠️ **This project is strictly for educational and case study purposes only. Commercial use or reselling is prohibited!**  
For full legal terms and conditions, please refer to the [LICENSE](LICENSE) file.
