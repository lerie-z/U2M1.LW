--==============================================================
-- GENERATING DATA FOR sa_time_dd.t_sa_time_dd
--==============================================================
INSERT INTO sa_time_dd.t_sa_time_dd
SELECT 
    TRUNC( sd + rn ),                                                           -- order_dt  
    to_char( sd + rn, 'YYYY' ),                                                 -- year_calendar 
    ( TO_DATE( '12/31/' || to_char( sd + rn, 'YYYY' ), 'MM/DD/YYYY' )
    - TRUNC( sd + rn, 'YEAR' ) ) + 1,                                           -- year_days_cnt    
    to_char( sd + rn, 'Q' ),                                                    -- quarter_number
        ( ( CASE
          WHEN to_char( sd + rn, 'Q' ) = 1 THEN
            TO_DATE( '03/31/' || to_char( sd + rn, 'YYYY' ), 'MM/DD/YYYY' )
          WHEN to_char( sd + rn, 'Q' ) = 2 THEN
            TO_DATE( '06/30/' || to_char( sd + rn, 'YYYY' ), 'MM/DD/YYYY' )
          WHEN to_char( sd + rn, 'Q' ) = 3 THEN
            TO_DATE( '09/30/' || to_char( sd + rn, 'YYYY' ), 'MM/DD/YYYY' )
          WHEN to_char( sd + rn, 'Q' ) = 4 THEN
            TO_DATE( '12/31/' || to_char( sd + rn, 'YYYY' ), 'MM/DD/YYYY' )
          END ) - TRUNC( sd + rn, 'Q' ) + 1 ),                                  -- quarter_days_cnt        
    TRUNC( sd + rn, 'Q' ),                                                      -- quarter begin_dt        
        ( CASE
          WHEN to_char( sd + rn, 'Q' ) = 1 THEN
            TO_DATE( '03/31/' || to_char( sd + rn, 'YYYY' ), 'MM/DD/YYYY' )
          WHEN to_char( sd + rn, 'Q' ) = 2 THEN
            TO_DATE( '06/30/' || to_char( sd + rn, 'YYYY' ), 'MM/DD/YYYY' )
          WHEN to_char( sd + rn, 'Q' ) = 3 THEN
            TO_DATE( '09/30/' || to_char( sd + rn, 'YYYY' ), 'MM/DD/YYYY' )
          WHEN to_char( sd + rn, 'Q' ) = 4 THEN
            TO_DATE( '12/31/' || to_char( sd + rn, 'YYYY' ), 'MM/DD/YYYY' )
          END ),                                                                -- quarter_end_dt            
        to_char( sd + rn, 'MM' ),                                               -- month_number
        to_char( sd + rn, 'FMMonth' ),                                          -- month_name
        to_char( last_day( sd + rn ), 'DD' ),                                   -- month_days_cnt        
        to_char( sd + rn, 'W' ),                                                -- week_number
            ( CASE
                  WHEN to_char( sd + rn, 'D' ) IN ( 1, 2, 3, 4, 5, 6 ) THEN
                    next_day( sd + rn, 'СУББОТА' )
                  ELSE
                    ( sd + rn )
                END ),                                                          -- week_end_date        
        to_char( sd + rn, 'fmDay' ),                                            -- day_name
        to_char( sd + rn, 'D' ),                                                -- day_number_week
        to_char( sd + rn, 'DD' ),                                               -- day_number_month
        to_char( sd + rn, 'DDD' )                                               -- day_number_year  
    FROM ( 
    SELECT 
      TO_DATE( '12/31/2010', 'MM/DD/YYYY' ) sd,
      ROWNUM rn
    FROM dual
      CONNECT BY LEVEL <= 12000 );
      
select * from sa_time_dd.t_sa_time_dd;