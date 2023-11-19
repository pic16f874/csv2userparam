BEGIN{ printf "{ \"data\":[";} 
{  
  if (NR==1) { for(i=1;i<=NF;i++) AA[i]=$i; } # read headers
  else {        if (NR>2) printf ", ";              # print comma between objects
                for(i=1;i<=NF;i++)
                   { if((i==1)&&(h==1)) printf "\n";
                     if (i==1)          printf "{";
                     printf "%s%s%s","\"{#"AA[i]"}\":\"", $i, "\"";
                     if (i==NF) printf "}"; 
                           else printf ",";
                    }
                
        }
}
END{ printf "%s", "]}"; if(h==1) printf "\n"; }



#awk -vh=1 'BEGIN{ printf "{ \"data\":[";} { if (NR==1) for(i=1;i<=NF;i++) AA[i]=$i;else { if (NR>2) printf ",";for(i=1;i<=NF;i++) { if((i==1)&&(h==1)) printf "\n"; if (i==1) printf "{";printf "%s%s%s","\"{#"AA[i]"}\":\"", $i, "\"";if (i==NF) printf "}";else printf ",";}}}END{ printf "%s", "]}"; if(h==1) printf "\n"; }' file.csv
