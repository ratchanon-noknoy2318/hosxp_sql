SELECT
    p.pname        AS "คำนำหน้า",
    p.fname        AS "ชื่อ",
    p.lname        AS "นามสกุล",
    p.sex          AS "เพศ",
    RIGHT(CONCAT('0', DAY(p.birthdate)), 2)   AS "วันเกิด",
    RIGHT(CONCAT('0', MONTH(p.birthdate)), 2) AS "เดือนเกิด",
    YEAR(p.birthdate)                         AS "ปีเกิด",
    p.cid                   AS "เลขบัตรประชาชน",
    p.house_regist_type_id  AS "ประเภทที่อยู่อาศัย",
    CONCAT(v.address_id, RIGHT(CONCAT('0', v.village_moo), 2)) AS "เลขที่อยู่อาศัย",
    v.village_name AS "ชื่อหมู่บ้าน",
    h.address AS "บ้านเลขที่",
    h.road    AS "ชื่อถนน",
    CASE
        WHEN p.pttype = "74" THEN "2"
        WHEN p.chronic_disease_list = "โรคเบาหวาน" OR p.chronic_disease_list = "โรคความดัน" THEN "1"
        ELSE " "
    END AS "ประเภทผู้ป่วย"

FROM person p
LEFT JOIN house h
    ON p.house_id = h.house_id
LEFT JOIN village v
    ON h.village_id = v.village_id
LEFT JOIN patient p3
    ON p.patient_hn = p3.hn
WHERE p.house_regist_type_id IN (1, 3)
  AND v.village_moo <> 0
  AND p.nationality = 99
  AND p.person_discharge_id = 9;
