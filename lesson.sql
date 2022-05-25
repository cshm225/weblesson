6
select * from パーティー where id="C02"

7
update パーティー set hp=120 where id="A01"

8
select id,名称,hp from パーティー where hp<100

9
select id,名称,mp from パーティー where mp>=100

10
select イベント番号,イベント名称,タイプ from イベント where タイプ<>"3"

11
select イベント番号,イベント名称 from イベント where イベント番号<=5

12
select イベント番号,イベント名称 from イベント where イベント番号>=20

13
select イベント番号,イベント名称 from イベント where 前提イベント番号 is null

14
select イベント番号,イベント名称,後続イベント番号 from イベント where 後続イベント番号 is not null

15
update パーティー
set 状態コード="01"
where 名称 like "%ミ%"

16
select id,名称,hp
from パーティー
where hp between 120 and 160

17
select 名称,職業コード
from パーティー
where 職業コード in("01","10","11")

18
select 名称,状態コード
from パーティー
where 状態コード not in("01","09")

19
select * from パーティー
where hp>100 and mp>100

20
select * from パーティー
where id like "A%" and 職業コード like "2%"

23
select distinct 状態コード from パーティー

24
select id,名称 from パーティー 
order by id asc

25
select * from パーティー order by 名称 desc

26
select 名称,hp,状態コード from パーティー 
order by 状態コード asc,hp desc

27
select タイプ,イベント番号,イベント名称,前提イベント番号,後続イベント番号
from イベント 
order by 1 asc,2 asc

28
select * from パーティー
order by hp desc 
limit 3

29
select * from パーティー
order by mp desc
limit 1 offset 2

30
select  
case when 職業コード<"10"
then concat("[A]")
WHEN 職業コード<"20"
then concat("[S]")
WHEN 職業コード<"30"
then concat("[M]")
end as 区分,職業コード,id as ID,名称
from パーティー
ORDER by 職業コード ASC

31
select イベント.イベント番号 
from イベント
left join 経験イベント
on イベント.イベント番号=経験イベント.イベント番号
where 経験イベント.クリア区分 is null

32
select イベント.イベント番号 from イベント
left join 経験イベント
on イベント.イベント番号=経験イベント.イベント番号
where 経験イベント.クリア区分 is not null and 経験イベント.クリア区分<>0 and イベント.タイプ="2"

33
select 名称 as なまえ,hp as 現在のhp, 
case when 職業コード="11" or 職業コード="21"
then hp+50
end as 装備後のHP
from パーティー

34
update パーティー set mp=mp+20
where id="A01" or id="A03"

35
SELECT 名称 as なまえ,hp as 現在のHP, hp*2 as 予想されるダメージ from パーティー
left join (SELECT * FROM コード WHERE コード種別=1)as c
on 職業コード=コード値
WHERE コード名称="武闘家"

36

select 名称 as なまえ,hp+"/"+mp as hpとmp,

case
when
状態コード="00" or 状態コード is null
then ""
else コード名称
end as ステータス
from パーティー
left join(select * from コード where コード種別=2)as c
on 状態コード=コード値

37
SELECT イベント番号,イベント名称,
CASE
when タイプ="01" then "強制"
WHEN タイプ="02" then "フリー"
when タイプ="03" then "特殊"
end as タイプ,
case 
when イベント番号<11 then "序盤"
when イベント番号<18 then "中盤"
else "終盤"
end as 発生時期
FROM `イベント` 

38
SELECT 名称 as なまえ,hp as 現在のhp,char_length(名称)*10 as 予想ダメージ
FROM `パーティー`

39
update パーティー set 状態コード="04"
where hp%4=0 or mp%4=0

40
SELECT floor(777*0.7) as 支払った金額

41
UPDATE パーティー SET hp=round(hp*1.3),mp=round(mp*1.3)

42
SELECT 名称 as なまえ,hp,power(hp,1) as 攻撃1回目,power(hp,2) as 攻撃2回目,power(hp,3) as 攻撃3回目
from パーティー
WHERE 職業コード="10"

43
SELECT 名称 as なまえ,hp,状態コード,
CASE
WHEN hp<=50 THEN "3"
when hp<=100 then "2"
WHEN hp<=150 then "1"
else "0"
end as リスク値
FROM `パーティー`
ORDER by リスク値 DESC,hp ASC

44
SELECT
CASE 
WHEN 前提イベント番号 IS null THEN "前提なし"
ELSE 前提イベント番号
END as 前提イベント番号,
イベント番号,
CASE
WHEN 後続イベント番号 IS null THEN "後続なし"
ELSE 後続イベント番号
END as 後続イベント番号
FROM イベント

45
SELECT max(hp),max(mp),min(hp),min(mp),avg(hp),avg(mp)
from パーティー

46
SELECT
case タイプ
WHEN コード値="01" THEN "強制"
WHEN コード値="02" THEN "フリー"
else "特殊"
end as タイプ,COUNT(タイプ) as イベント数
FROM `イベント` 
left JOIN コード
ON タイプ=コード.コード値
WHERE コード種別=3
GROUP BY タイプ

47
SELECT クリア結果,COUNT(クリア結果) as イベント数 FROM `経験イベント`WHERE クリア結果 is NOT null GROUP BY クリア結果 

48
SELECT 
CASE
WHEN SUM(mp-500)<500 then "mitoreteru"
WHEN SUM(mp)>999 then "bouzen"
else "hirehusu"
end as act
FROM `パーティー` 