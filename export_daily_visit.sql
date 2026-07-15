SELECT ovst.hn,
    ovst.vsttime,
    ovst.spclty,
    CONCAT(patient.fname,' ',patient.lname) AS patient_name,
    patient.birthday,
    spclty.name
FROM ovst
    LEFT JOIN patient ON patient.hn = ovst.hn
    LEFT JOIN spclty ON spclty.spclty = ovst.spclty
WHERE ovst.vstdate = CURDATE()
ORDER BY spclty.name;
