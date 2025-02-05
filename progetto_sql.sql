-- il codice l'ho indendato con chatgpt per una maggiore facilità di lettura ma il codice è scritto da me :)

-- Età del cliente (da tabella cliente).

drop table if exists età_cliente;
create temporary table età_cliente as
select id_cliente,
		year(current_date()) - year(data_nascita) as Età 
from cliente;

-- Numero di conti posseduti

drop table if exists num_conti;
create temporary table num_conti as 
SELECT 
    conto.id_cliente,
    count(conto.id_conto) as num_conti
from conto
GROUP BY 
    conto.id_cliente
order by id_cliente desc;

-- numero di conti per tipologia

drop table if exists num_conti_0;
create temporary table num_conti_0 as 
SELECT 
    conto.id_cliente,
    count(conto.id_conto) as num_conti_0
from conto
where id_tipo_conto = 0
GROUP BY 
    conto.id_cliente
order by id_cliente desc;

drop table if exists num_conti_1;

create temporary table num_conti_1 as 
SELECT 
    conto.id_cliente,
    count(conto.id_conto) as num_conti_1
from conto
where id_tipo_conto = 1
GROUP BY 
    conto.id_cliente
order by id_cliente desc; 

drop table if exists num_conti_2;

create temporary table num_conti_2 as 
SELECT 
    conto.id_cliente,
    count(conto.id_conto) as num_conti_2
from conto
where id_tipo_conto = 2
GROUP BY 
    conto.id_cliente
order by id_cliente desc; 

drop table if exists num_conti_3;

create temporary table num_conti_3 as 
SELECT 
    conto.id_cliente,
    count(conto.id_conto) as num_conti_3
from conto
where id_tipo_conto = 3
GROUP BY 
    conto.id_cliente
order by id_cliente desc; 

-- Numero di transazioni in entrata su tutti i conti + importo transazioni in entrata

drop table if exists num_trans_entrata;
create temporary table num_trans_entrata as 
select cliente.id_cliente,
    count(*) as num_trans_entrata,
    sum(importo) as sum_trans_entrata
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "+"
group by cliente.id_cliente;

-- Numero di transazioni in uscita su tutti i conti + importo transazioni in uscita

drop table if exists num_trans_uscita;
create temporary table num_trans_uscita as 
select cliente.id_cliente,
    count(*) as num_trans_uscita,
    sum(importo) as sum_trans_uscita
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "-"
group by cliente.id_cliente;

-- importi e numero di transazioni in entrata per tipo conto

drop table if exists importi_transazioni_entrata_0;
create temporary table importi_transazioni_entrata_0 as
select 
    cliente.id_cliente,
    sum(importo) as sum_importi_entrata_0,
    count(*) as count_transazioni_entrata_0
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "+" and conto.id_tipo_conto = 0
group by cliente.id_cliente;

drop table if exists importi_transazioni_entrata_1;
create temporary table importi_transazioni_entrata_1 as
select 
    cliente.id_cliente,
    sum(importo) as sum_importi_entrata_1,
    count(*) as count_transazioni_entrata_1
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "+" and conto.id_tipo_conto = 1
group by cliente.id_cliente;

drop table if exists importi_transazioni_entrata_2;
create temporary table importi_transazioni_entrata_2 as
select 
    cliente.id_cliente,
    sum(importo) as sum_importi_entrata_2,
    count(*) as count_transazioni_entrata_2
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "+" and conto.id_tipo_conto = 2
group by cliente.id_cliente;

drop table if exists importi_transazioni_entrata_3;
create temporary table importi_transazioni_entrata_3 as
select 
    cliente.id_cliente,
    sum(importo) as sum_importi_entrata_3,
    count(*) as count_transazioni_entrata_3
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "+" and conto.id_tipo_conto = 3
group by cliente.id_cliente;

-- importi e numero di transazioni in uscita per tipo conto

drop table if exists importi_transazioni_uscita_0;
create temporary table importi_transazioni_uscita_0 as
select 
    cliente.id_cliente,
    sum(importo) as sum_importi_uscita_0,
    count(*) as count_transazioni_uscita_0
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "-" and conto.id_tipo_conto = 0
group by cliente.id_cliente;

drop table if exists importi_transazioni_uscita_1;
create temporary table importi_transazioni_uscita_1 as
select 
    cliente.id_cliente,
    sum(importo) as sum_importi_uscita_1,
    count(*) as count_transazioni_uscita_1
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "-" and conto.id_tipo_conto = 1
group by cliente.id_cliente;

drop table if exists importi_transazioni_uscita_2;
create temporary table importi_transazioni_uscita_2 as
select 
    cliente.id_cliente,
    sum(importo) as sum_importi_uscita_2,
    count(*) as count_transazioni_uscita_2
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "-" and conto.id_tipo_conto = 2
group by cliente.id_cliente;

drop table if exists importi_transazioni_uscita_3;
create temporary table importi_transazioni_uscita_3 as
select 
    cliente.id_cliente,
    sum(importo) as sum_importi_uscita_3,
    count(*) as count_transazioni_uscita_3
from cliente 
join conto 
    on cliente.id_cliente = conto.id_cliente
join tipo_conto 
    on conto.id_tipo_conto = tipo_conto.id_tipo_conto 
join transazioni 
    on conto.id_conto = transazioni.id_conto
join tipo_transazione 
    on transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
where segno = "-" and conto.id_tipo_conto = 3
group by cliente.id_cliente;

-- tabella finale con coalesce che sostituisce i valori null con 0

drop table if exists info_transazioni_x_cliente;
create temporary table info_transazioni_x_cliente as
select 
    cliente.id_cliente,
    
    -- Età del cliente
    year(current_date()) - year(cliente.data_nascita) as Età,

    -- Indicatori sulle transazioni
    coalesce(num_trans_uscita.num_trans_uscita, 0) as num_trans_uscita,
    coalesce(num_trans_entrata.num_trans_entrata, 0) as num_trans_entrata,
    coalesce(num_trans_uscita.sum_trans_uscita, 0) as sum_trans_uscita,
    coalesce(num_trans_entrata.sum_trans_entrata, 0) as sum_trans_entrata,

    -- Indicatori sui conti
    coalesce(num_conti.num_conti, 0) as num_conti,
    coalesce(num_conti_0.num_conti_0, 0) as num_conti_0,
    coalesce(num_conti_1.num_conti_1, 0) as num_conti_1,
    coalesce(num_conti_2.num_conti_2, 0) as num_conti_2,
    coalesce(num_conti_3.num_conti_3, 0) as num_conti_3,

    -- Indicatori sulle transazioni per tipologia di conto
    coalesce(importi_transazioni_uscita_0.count_transazioni_uscita_0, 0) as count_transazioni_uscita_0,
    coalesce(importi_transazioni_entrata_0.count_transazioni_entrata_0, 0) as count_transazioni_entrata_0,
    coalesce(importi_transazioni_uscita_1.count_transazioni_uscita_1, 0) as count_transazioni_uscita_1,
    coalesce(importi_transazioni_entrata_1.count_transazioni_entrata_1, 0) as count_transazioni_entrata_1,
    coalesce(importi_transazioni_uscita_2.count_transazioni_uscita_2, 0) as count_transazioni_uscita_2,
    coalesce(importi_transazioni_entrata_2.count_transazioni_entrata_2, 0) as count_transazioni_entrata_2,
    coalesce(importi_transazioni_uscita_3.count_transazioni_uscita_3, 0) as count_transazioni_uscita_3,
    coalesce(importi_transazioni_entrata_3.count_transazioni_entrata_3, 0) as count_transazioni_entrata_3,

    coalesce(importi_transazioni_uscita_0.sum_importi_uscita_0, 0) as sum_importi_uscita_0,
    coalesce(importi_transazioni_entrata_0.sum_importi_entrata_0, 0) as sum_importi_entrata_0,
    coalesce(importi_transazioni_uscita_1.sum_importi_uscita_1, 0) as sum_importi_uscita_1,
    coalesce(importi_transazioni_entrata_1.sum_importi_entrata_1, 0) as sum_importi_entrata_1,
    coalesce(importi_transazioni_uscita_2.sum_importi_uscita_2, 0) as sum_importi_uscita_2,
    coalesce(importi_transazioni_entrata_2.sum_importi_entrata_2, 0) as sum_importi_entrata_2,
    coalesce(importi_transazioni_uscita_3.sum_importi_uscita_3, 0) as sum_importi_uscita_3,
    coalesce(importi_transazioni_entrata_3.sum_importi_entrata_3, 0) as sum_importi_entrata_3

from cliente
left join importi_transazioni_entrata_0 on cliente.id_cliente = importi_transazioni_entrata_0.id_cliente
left join importi_transazioni_entrata_1 on cliente.id_cliente = importi_transazioni_entrata_1.id_cliente
left join importi_transazioni_entrata_2 on cliente.id_cliente = importi_transazioni_entrata_2.id_cliente
left join importi_transazioni_entrata_3 on cliente.id_cliente = importi_transazioni_entrata_3.id_cliente
left join importi_transazioni_uscita_0 on cliente.id_cliente = importi_transazioni_uscita_0.id_cliente
left join importi_transazioni_uscita_1 on cliente.id_cliente = importi_transazioni_uscita_1.id_cliente
left join importi_transazioni_uscita_2 on cliente.id_cliente = importi_transazioni_uscita_2.id_cliente
left join importi_transazioni_uscita_3 on cliente.id_cliente = importi_transazioni_uscita_3.id_cliente
left join num_trans_entrata on cliente.id_cliente = num_trans_entrata.id_cliente
left join num_trans_uscita on cliente.id_cliente = num_trans_uscita.id_cliente
left join num_conti on cliente.id_cliente = num_conti.id_cliente
left join num_conti_0 on cliente.id_cliente = num_conti_0.id_cliente
left join num_conti_1 on cliente.id_cliente = num_conti_1.id_cliente
left join num_conti_2 on cliente.id_cliente = num_conti_2.id_cliente
left join num_conti_3 on cliente.id_cliente = num_conti_3.id_cliente;

-- visualizzazione delle prime 10 righe della tabella finale

select * from info_transazioni_x_cliente limit 10