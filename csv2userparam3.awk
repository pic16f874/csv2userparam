#!/usr/bin/awk

BEGIN{ printf "{\"data\":[";}
{
  if (NR==1) { NR2=1;
               for(i=1;i<=NF;i++) AA[i]=$i; # read headers
              }
        else { if ("#"==substr($0,1,1)) next; else NR2++;
               if (NR2>2) printf ",";        # print comma between objects
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
