--1. количество исполнителей в каждом жанре; 
SELECT 
	m.Name, 
	COUNT(mp.performerid) 
FROM 
	musicgenre m
	LEFT JOIN musicgenreperformer mp
		ON m.id = mp.genreid 
GROUP BY m.name
ORDER BY COUNT(mp.performerid) DESC;


--2. количество треков, вошедших в альбомы 2019-2020 годов;
SELECT 
	a.name, 
	a.productionyear, 
	COUNT(t) 
FROM 
	album a
	LEFT JOIN trek t 
		ON a.id = t.albumid 
WHERE a.productionyear BETWEEN 2019 AND 2020
GROUP BY a.name, productionyear 
ORDER BY COUNT(t) DESC;


--3. средняя продолжительность треков по каждому альбому;
SELECT 
	a.name, 
	AVG(t.duration) 
FROM 
	album a
	LEFT JOIN trek t 
		ON a.id = t.albumid 
GROUP BY a.name
ORDER BY AVG(t.duration) DESC;


--4. все исполнители, которые не выпустили альбомы в 2020 году;
SELECT 
	p.name  
FROM 
	performer p 
WHERE p.name != ALL (SELECT p.name 
						FROM album a 
							LEFT JOIN albumperformer ap  
								ON  a.id = ap.albumid
							LEFT JOIN performer p 
								ON p.id = ap.performerid 
						WHERE a.productionyear = 2020)
GROUP BY p.name;


--5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT 
	pl.name 
FROM 
	playlist pl
	LEFT JOIN playlisttrek plt  
		ON  pl.id = plt.playlistid
	LEFT JOIN trek t  
		ON  t.id = plt.trekid
	LEFT JOIN album a  
		ON a.id = t.albumid	
	LEFT JOIN albumperformer ap  
		ON  a.id = ap.albumid
	LEFT JOIN performer p 
		ON p.id = ap.performerid
WHERE p.name LIKE 'Rammstein'
GROUP BY pl.name
ORDER BY pl.name;


--6. название альбомов, в которых присутствуют исполнители более 1 жанра; 
SELECT 
	a.name, COUNT(m.id)
FROM 
	album a 
	LEFT JOIN albumperformer ap  
		ON  a.id = ap.albumid
	LEFT JOIN performer p 
		ON  ap.performerid = p.id
	LEFT JOIN musicgenreperformer mp  
		ON p.id = mp.performerid
	LEFT JOIN musicgenre m  
		ON m.id = mp.genreid
GROUP BY a.name		
HAVING COUNT(m.id) > 1;


--7. наименование треков, которые не входят в сборники;
SELECT 
	t.name 
FROM 
	trek t 
	LEFT JOIN playlisttrek plt  
		ON  t.id = plt.trekid
	LEFT JOIN playlist pl  
		ON  pl.id = plt.playlistid
WHERE pl.id  IS NULL;


--8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT 
	 p.name, duration 
FROM 
	trek t 
	LEFT JOIN album a 
		ON a.id = t.albumid	
	LEFT JOIN albumperformer ap 
		ON a.id = ap.albumid 
	LEFT JOIN performer p 
		ON p.id = ap.performerid
WHERE duration = (SELECT MIN(duration)FROM trek);


--9. название альбомов, содержащих наименьшее количество треков.
SELECT 
	 a.name, COUNT(t.id)
FROM 
	trek t 
	JOIN album a 
		ON a.id = t.albumid	
GROUP BY a.name
HAVING COUNT(t.id) = (SELECT 
							COUNT(t.id)
					    FROM 
							trek t 
							JOIN album a 
								ON a.id = t.albumid
				  		GROUP BY a.name
				  		ORDER BY t.COUNT LIMIT 1);
