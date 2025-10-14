.shell echo "["
.mode box
drop table if exists MARIN;
drop table if exists RESERVATION;
drop table if exists BATEAU;

create table MARIN(
	MID int primary key,
	MNOM varchar,
	NOTE int,
	AGE real
);

create table BATEAU(
	BID int primary key,
	BNOM varchar,
	COULEUR varchar
);

create table RESERVATION(
	MID int not null,
	BID int,
	JOUR date,
	foreign key (BID)
		references BATEAU(BID),
	foreign key (MID)
		references MARIN(MID),
	primary key (BID, JOUR)
);

insert into BATEAU values(101, 'Interlake', 'blue');
insert into BATEAU values(102, 'Interlake', 'red');
insert into BATEAU values(103, 'Clipper', 'red');
insert into BATEAU values(104, 'Marine', 'red');

insert into MARIN values(22, 'Dustin' , 7, 45.0);
insert into MARIN values(23, 'Brutus' , 5, 34.0);
insert into MARIN values(24, 'Dustin' , 8, 55.5);
insert into MARIN values(25, 'Andy'   , 6, 41.5);
insert into MARIN values(26, 'Rusty'  ,10, 53.5);
insert into MARIN values(27, 'Horatio', 7, 47.0);
insert into MARIN values(28, 'Andy'   , 2, 41.5);
insert into MARIN values(29, 'Brutus' , 8, NULL);
insert into MARIN values(30, 'Brutus' , 9, 54.0);

insert into RESERVATION values(22, 101, '2024-01-06');
insert into RESERVATION values(22, 102, '2024-01-01');
insert into RESERVATION values(22, 103, '2024-01-14');
insert into RESERVATION values(22, 104, '2024-01-02');
insert into RESERVATION values(23, 104, '2024-01-14');
insert into RESERVATION values(24, 102, '2024-01-07');
insert into RESERVATION values(24, 103, '2024-01-02');
insert into RESERVATION values(24, 104, '2024-01-16');
insert into RESERVATION values(25, 101, '2024-01-07');
insert into RESERVATION values(25, 102, '2024-01-02');
insert into RESERVATION values(27, 102, '2024-01-10');
insert into RESERVATION values(27, 104, '2024-01-22');
insert into RESERVATION values(28, 104, '2024-01-06');
insert into RESERVATION values(28, 103, '2024-01-15');
insert into RESERVATION values(29, 102, '2024-01-03');
insert into RESERVATION values(30, 102, '2024-01-25');
insert into RESERVATION values(30, 103, '2024-01-16');

select * from RESERVATION;
.shell echo ","
select * from MARIN;
.shell echo ","
select * from BATEAU;

-- Problème sur les bateaux rouges.
-- Navigateurs expérimentés :
-- - plus de 40 ans (5)
-- - ayant reservé plus de 2 bateaux (4)
-- - n'ayant jamais reservé un bateau que personne n'a reservé (3)
-- Donner la note moyenne des navigateurs expérimenté pour chaque bateau rouge
-- avec un nom des navigateurs les plus expérimentés
.shell echo ',\"all sailors name\",'
select distinct M.MNOM from MARIN as M;

.shell echo ',\"Tous les bateaux rouges\",'
drop view if exists BATEAU_RED;
create view BATEAU_RED(BID, BNOM) as
	select BID, BNOM
	from BATEAU as B
	where B.COULEUR = 'red';

select B.BID, B.BNOM
from BATEAU as B
where B.COULEUR = 'red';

.shell echo ',\"sailors name with age >= 40 and rating >= 5\",'
select M.MNOM, M.MID from MARIN as M
where M.NOTE >= 5 and M.AGE >= 40;

.shell echo ',\"Sailors with more than 2 reservations\",'
select R.MID, count(*) as R_NB
from RESERVATION as R
group by R.MID
having count(*) >= 2;

.shell echo ',\"Reservation et Note Marin\",'
select R.BID, M.NOTE, R.JOUR
from RESERVATION as R
natural join MARIN as M;

.shell echo ',\"First sailors to reserve each boat\",'
select R1.BID, R1.MID, R1.JOUR
from RESERVATION as R1
where R1.JOUR in ( -- "=" possible
    select min(R2.JOUR)
    from RESERVATION R2
    where R1.BID = R2.BID
)
group by R1.BID;

drop view if exists MARIN_M5_P40;
create view MARIN_M5_P40(MID) as
	select M.MID
	from MARIN as M
	where M.NOTE >= 5 and M.AGE >= 40;
drop view if exists MARIN_PLUS_2_BATEAU;
create view MARIN_PLUS_2_BATEAU(MID) as
	select R.MID
	from RESERVATION R
	group by R.MID
	having count(*) >= 2;
drop view if exists MARIN_PREMIER_RESERVATION;
create view MARIN_PREMIER_RESERVATION(MID) as
	select R1.MID
	from RESERVATION R1
	where R1.JOUR = (
		select min(R2.JOUR)
		from RESERVATION R2
		where R1.BID = R2.BID
	)
	group by R1.BID;
drop view if exists M_EXP;
create view M_EXP(MID, NOTE) as
	select MID, NOTE from
		(select * from
			(select * from MARIN_M5_P40
				intersect
			select * from MARIN_PLUS_2_BATEAU)
			except
		select * from MARIN_PREMIER_RESERVATION)
	natural join MARIN;

.shell echo ',\"Marin expérimenté\",'
select MID, MNOM, NOTE from
    (select * from
        (select * from MARIN_M5_P40
        intersect
        select * from MARIN_PLUS_2_BATEAU)
    except
    select * from MARIN_PREMIER_RESERVATION)
natural join MARIN;

.shell echo ',\"Note Moyenne Par Bateau\",'
select R.BID, avg(M.NOTE) as NOTE
from RESERVATION as R
natural join MARIN as M
group by R.bid;

drop view if exists RESERVATION_M_EXP;
create view RESERVATION_M_EXP(BID, MID) as
	select R.BID, R.MID
	from RESERVATION R
	where R.MID in M_EXP;

.shell echo ',\"Requete complète\",'
select R.BID, avg(M.NOTE) as NOTE, B.BNOM
	from RESERVATION as R
	natural join M_EXP as M
	natural join BATEAU_RED as B
	group by R.bid;

.shell echo ','
select R.MID, R.BID
from RESERVATION as R
where R.MID in (select M_EXP.MID from M_EXP)
group by R.BID;

.shell echo ','
with NOTE_MOY(BID, NOTE, BNOM) as (
    select R.BID, avg(M.NOTE) as NOTE, B.BNOM
    from RESERVATION as R
    natural join M_EXP as M
    natural join BATEAU_RED as B
    group by R.bid
), M1_EXP(MID, BID) as (
    select R.MID, R.BID
    from RESERVATION as R
    where R.MID in (select M_EXP.MID from M_EXP)
    group by R.BID
)
select NOTE_MOY.BNOM, NOTE_MOY.NOTE, MARIN.MNOM 
from NOTE_MOY
natural join M1_EXP
join MARIN on MARIN.MID = M1_EXP.MID;

.shell echo "]"