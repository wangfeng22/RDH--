function [I2,end1,flg]=Embed(I1,data,pixelnum)
I1=double(I1);
I2=I1;
[PExh,PExv,PE]=DirectionalPredictionValue(I2);
[row,col]=size(I2);
 j=1;
 lend=1;
 flg=0;
 sign=0;
 while(j<=col)
     i=sign+1;
      while(i<=row)
          eh=PExh(i,j);
          ev=PExv(i,j);              
          if(eh>=0&&ev>=0)
              if(eh==0||ev==0)
                  eh=eh+data(1,lend);
                  ev=ev+data(1,lend);
                  lend=lend+1;
              else
                  eh=eh+1;
                  ev=ev+1;
              end
          end
          if(eh<0&&ev<0)
              if(eh==-1||ev==-1)
                  eh=eh-data(1,lend);
                  ev=ev-data(1,lend);
                  lend=lend+1;
              else
                  eh=eh-1;
                  ev=ev-1;
              end
          end
if(abs(PExh(i,j))<=abs(PExv(i,j)))
    I2(i,j)=I1(i,j)+(eh-PExh(i,j));
else
    I2(i,j)=I1(i,j)+(ev-PExv(i,j));
end
        if lend>pixelnum
            break;
        end
        i=i+2;
     end
     if lend>pixelnum
             break;
     end
     j=j+1;
     sign=1-sign;
 end
 end1=lend;
 if lend<=pixelnum
     sign=1;
     j=1;
     flg=1;
     [PExh,PExv,PE]=DirectionalPredictionValue(I2);
     while(j<=col)
         i=sign+1;
         while(i<=row)
          eh=PExh(i,j);
          ev=PExv(i,j);             
          if(eh>=0&&ev>=0)
              if(eh==0||ev==0)
                  eh=eh+data(1,lend);
                  ev=ev+data(1,lend);
                  lend=lend+1;
              else
                  eh=eh+1;
                  ev=ev+1;
              end
          end
          if(eh<0&&ev<0)
              if(eh==-1||ev==-1)
                  eh=eh-data(1,lend);
                  ev=ev-data(1,lend);
                  lend=lend+1;
              else
                  eh=eh-1;
                  ev=ev-1;
              end
          end
if(abs(PExh(i,j))<=abs(PExv(i,j)))
    I2(i,j)=I1(i,j)+(eh-PExh(i,j));
else
    I2(i,j)=I1(i,j)+(ev-PExv(i,j));
end
          i=i+2;
         if lend>pixelnum
            break;
         end
        end
         if lend>pixelnum
                 break;
         end
         sign=1-sign;
         j=j+1;
     end
 end