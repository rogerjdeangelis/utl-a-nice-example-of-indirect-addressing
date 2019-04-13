A nice example of indirect addressing                                                                                      
                                                                                                                           
Indirect addressing is probably underused?                                                                                 
                                                                                                                           
github                                                                                                                     
http://tinyurl.com/y2mp6mbp                                                                                                
https://github.com/rogerjdeangelis/utl-a-nice-example-of-indirect-addressing                                               
                                                                                                                           
http://tinyurl.com/y3aqkgx6                                                                                                
https://communities.sas.com/t5/SAS-Programming/Conditionally-populate-all-columns-based-on-category/m-p/550346             
                                                                                                                           
Page Miller                                                                                                                
https://communities.sas.com/t5/user/viewprofilepage/user-id/10892                                                          
                                                                                                                           
*_                   _                                                                                                     
(_)_ __  _ __  _   _| |_                                                                                                   
| | '_ \| '_ \| | | | __|                                                                                                  
| | | | | |_) | |_| | |_                                                                                                   
|_|_| |_| .__/ \__,_|\__|                                                                                                  
        |_|                                                                                                                
;                                                                                                                          
                                                                                                                           
data hav1st;                                                                                                               
input (id model vara varb) ($);                                                                                            
cards4;                                                                                                                    
1 cat1 v1 v2                                                                                                               
2 cat2 v3 v4                                                                                                               
3 cat3 v4 v5                                                                                                               
;;;;                                                                                                                       
run;                                                                                                                       
                                                                                                                           
data hav2nd;                                                                                                               
input (id model v1 v2 v3 v4 v5) ($);                                                                                       
cards4;                                                                                                                    
1 cat1 1 2 3 4 5                                                                                                           
2 cat2 1 2 3 4 5                                                                                                           
3 cat3 1 2 3 4 5                                                                                                           
;;;;                                                                                                                       
run;                                                                                                                       
                                                                                                                           
Up to 40 obs WORK.HAV1ST total obs=3                                                                                       
                                                                                                                           
Obs    ID    MODEL    VARA    VARB                                                                                         
                                                                                                                           
 1     1     cat1      v1      v2                                                                                          
 2     2     cat2      v3      v4                                                                                          
 3     3     cat3      v4      v5                                                                                          
                                                                                                                           
Up to 40 obs WORK.HAV2ND total obs=3                                                                                       
                                                                                                                           
Obs    ID    MODEL    V1    V2    V3    V4    V5                                                                           
                                                                                                                           
 1     1     cat1     1     2     3     4     5                                                                            
 2     2     cat2     1     2     3     4     5                                                                            
 3     3     cat3     1     2     3     4     5                                                                            
                                                                                                                           
=====                                                                                                                      
RULES                                                                                                                      
======                                                                                                                     
Up to 40 obs from WANT total obs=3                                                                                         
                                                                                                                           
                      Use the values of  VARA and VARB to select the correct V#                                            
                                                                                                                           
Obs    ID    MODEL    VARA    VARB    V1    V2    V3    V4    V5    FIRST    SECOND                                        
                                                                                                                           
 1     1     cat1      v1      v2     1     2     3     4     5       1        2                                           
                                     [-------]                                                                             
 2     2     cat2      v3      v4     1     2     3     4     5       3        4                                           
                                                 [-------]                                                                 
                                                                                                                           
 3     3     cat3      v4      v5     1     2     3     4     5       4        5                                           
                                                       [-------]                                                           
*            _               _                                                                                             
  ___  _   _| |_ _ __  _   _| |_                                                                                           
 / _ \| | | | __| '_ \| | | | __|                                                                                          
| (_) | |_| | |_| |_) | |_| | |_                                                                                           
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                          
                |_|                                                                                                        
;                                                                                                                          
                                                                                                                           
Up to 40 obs from WANT total obs=3                                                                                         
                                                                                                                           
Obs    ID    MODEL    VARA    VARB    V1    V2    V3    V4    V5    FIRST    SECOND                                        
                                                                                                                           
 1     1     cat1      v1      v2     1     2     3     4     5       1        2                                           
 2     2     cat2      v3      v4     1     2     3     4     5       3        4                                           
 3     3     cat3      v4      v5     1     2     3     4     5       4        5                                           
                                                                                                                           
*                                                                                                                          
 _ __  _ __ ___   ___ ___  ___ ___                                                                                         
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                        
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                        
| .__/|_|  \___/ \___\___||___/___/                                                                                        
|_|                                                                                                                        
;                                                                                                                          
                                                                                                                           
data want;                                                                                                                 
    merge hav1st hav2nd;                                                                                                   
    by model;                                                                                                              
    first  = vvaluex(vara);                                                                                                
    second = vvaluex(varb);                                                                                                
run;                                                                                                                       
                                                                                                                           
                                                                                                                           
