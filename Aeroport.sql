--- Question 1 ----


SELECT nompilote, adresse
FROM PILOTE;

----- Question 2 -----
SELECT DISTINCT villedep
FROM VOL;

----- Question 3 ----- 
SELECT numvol, villedep, villearr, heuredep, heurearr
FROM VOL
WHERE villedep = 'Paris' AND heuredep BETWEEN '14:00' AND '16:00';

----- Question 4 ----
SELECT *
FROM AVION
WHERE nomavion LIKE 'Airbus%';

----- Question 5 -----
SELECT *
FROM PILOTE
WHERE nompilote LIKE '_i%';

----- Question 6 ------
SELECT *
FROM AVION
WHERE capacite BETWEEN 200 AND 300;

------- Question 7 ------
SELECT numavion, nomavion, localisation
FROM AVION
WHERE capacite > 200 AND localisation <> 'Nice'
ORDER BY numavion DESC;

------ Question 8 ------
SELECT DISTINCT P.nompilote
FROM PILOTE p
JOIN VOL v ON p.numpilote = V.numpilote
WHERE v.villedep = 'Paris';

----- Question 9 -----
SELECT DISTINCT P.nompilote
FROM PILOTE p
JOIN AVION a ON p.adresse = a.localisation
WHERE a.nomavion LIKE 'Airbus%';

----- Question 10 -----
SELECT DISTINCT p.nompilote
FROM PILOTE p
JOIN VOL v ON p.numpilote = v.numpilote
JOIN VOL v2 ON v.numvol = v2.numvol
WHERE v2.numpilote = 2 AND p.nompilote <> 2;

----- Question 11 ------
SELECT avion.numavion, avion.nomavion
FROM avion
JOIN vol ON avion.localisation = vol.villedep
WHERE avion.capacite BETWEEN 200 AND 300
AND vol.numvol = 'USA050';


------ Question 12 ------
select numavion, nomavion
from avion
where capacite > all (select capacite from avion where localisation = 'Nice');

----- Question 13 -----
select numavion, nomavion
from avion
where capacite > any (select capacite from avion where localisation = 'Nice');



----- Question 14 -----
SELECT DISTINCT NOMPILOTE
from pilote
INNER JOIN avion ON avion.LOCALISATION = pilote.ADRESSE and avion.NOMAVION LIKE '%Airbus%'
where NUMPILOTE IN (
  SELECT NUMPILOTE
  from vol
  where VILLEDEP IN(
    SELECT VILLEARR
    from vol
    INNER JOIN pilote ON pilote.NUMPILOTE = vol.NUMPILOTE and pilote.NOMPILOTE LIKE '%Ader%'
  )
);



