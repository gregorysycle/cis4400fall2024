
CREATE SCHEMA IF NOT EXISTS otc_markets;

CREATE  TABLE otc_markets.dim_date ( 
	date_id              double precision  NOT NULL  ,
	year_number          integer    ,
	month_number         integer    ,
	quarter_number       integer    ,
	day_number           date    ,
	hour_number          date    ,
	is_holiday           boolean    ,
	day_name             varchar(12)    ,
	month_name           varchar(20)    ,
	week_of_month        integer    ,
	week_of_year         integer    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( date_id )
 );

CREATE  TABLE otc_markets.dim_otc_tier ( 
	otc_tier_id          double precision  NOT NULL  ,
	otc_tier_name        varchar(100)    ,
	CONSTRAINT pk_dim_otc_tier PRIMARY KEY ( otc_tier_id )
 );

CREATE  TABLE otc_markets.dim_security ( 
	security_id          integer  NOT NULL  ,
	company_id           integer    ,
	trading_symbol       char(10)    ,
	cusip_number         char(9)    ,
	security_name        char(50)    ,
	security_type        varchar(75)    ,
	security_class       char(1)    ,
	security_status      varchar(20)    ,
	security_description varchar(250)    ,
	country              char(30)    ,
	"state"              char(30)    ,
	company_name         varchar(100)    ,
	CONSTRAINT pk_dim_security PRIMARY KEY ( security_id )
 );

CREATE  TABLE otc_markets.dim_source ( 
	source_id            double precision  NOT NULL  ,
	source_name          char(50)    ,
	CONSTRAINT pk_dim_source PRIMARY KEY ( source_id ),
	CONSTRAINT unq_dim_source_source_name UNIQUE ( source_name ) 
 );

CREATE  TABLE otc_markets.dim_trading_venue ( 
	trading_venue_id     double precision  NOT NULL  ,
	trading_venue_name   char(20)    ,
	CONSTRAINT pk_dim_trading_venue PRIMARY KEY ( trading_venue_id )
 );

CREATE  TABLE otc_markets.fact_otc_transactions ( 
	closing_inside_bid   numeric(11,5)    ,
	closing_inside_ask   numeric(11,5)    ,
	facts_id             double precision  NOT NULL  ,
	closing_mid_price    numeric(11,5)    ,
	price_open           numeric(11,5)    ,
	price_high           numeric(11,5)    ,
	price_low            numeric(11,5)    ,
	share_volume         bigint    ,
	price_last           numeric(11,5)    ,
	previous_close_price numeric(11,5)    ,
	dollar_volume        numeric(30,20)    ,
	trade_count          integer    ,
	otc_link_share_volume bigint    ,
	otc_link_dollar_volume numeric(30,20)    ,
	otc_link_trade_count integer    ,
	reg_sho_status_flag  char(1)    ,
	rule_3210_status_flag char(1)    ,
	short_interest_shares bigint    ,
	number_of_market_makers integer    ,
	bona_fide_continous  integer    ,
	closing_best_bid     numeric(11,5)    ,
	closing_best_ask     numeric(11,5)    ,
	total_shares_outstanding numeric(16,1)    ,
	closing_spread_inside numeric(11,5)    ,
	closing_spread_best  integer    ,
	pivot_point          integer    ,
	caveat_emptor_flag   char(1)    ,
	source_id            double precision  NOT NULL  ,
	otc_tier_id          double precision  NOT NULL  ,
	trading_venue_id     double precision  NOT NULL  ,
	security_id          double precision  NOT NULL  ,
	date_id              double precision  NOT NULL  ,
	CONSTRAINT pk_fact_otc_transactions PRIMARY KEY ( facts_id )
 );

ALTER TABLE otc_markets.fact_otc_transactions ADD CONSTRAINT fk_fact_otc_transactions_dim_source FOREIGN KEY ( source_id ) REFERENCES otc_markets.dim_source( source_name );

ALTER TABLE otc_markets.fact_otc_transactions ADD CONSTRAINT fk_fact_otc_transactions_dim_otc_tier FOREIGN KEY ( otc_tier_id ) REFERENCES otc_markets.dim_otc_tier( otc_tier_id );

ALTER TABLE otc_markets.fact_otc_transactions ADD CONSTRAINT fk_fact_otc_transactions_dim_trading_venue FOREIGN KEY ( trading_venue_id ) REFERENCES otc_markets.dim_trading_venue( trading_venue_id );

ALTER TABLE otc_markets.fact_otc_transactions ADD CONSTRAINT fk_fact_otc_transactions_dim_date FOREIGN KEY ( date_id ) REFERENCES otc_markets.dim_date( date_id );

ALTER TABLE otc_markets.fact_otc_transactions ADD CONSTRAINT fk_fact_otc_transactions_dim_security FOREIGN KEY ( security_id ) REFERENCES otc_markets.dim_security( security_id );

COMMENT ON COLUMN otc_markets.fact_otc_transactions.closing_spread_inside IS 'Difference of Ask and Bid (Ask - Bid)/Ask MUST BE CALCULATED';

COMMENT ON COLUMN otc_markets.fact_otc_transactions.closing_spread_best IS 'must be reviewed';

COMMENT ON COLUMN otc_markets.fact_otc_transactions.pivot_point IS 'High + LOW + CLOSE / 3';
