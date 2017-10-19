trn=[];
test=[];
tims=[];
co=1;
tp=0;tn=0;fp=0;fn=0;
tp2=0;tn2=0;fp2=0;fn2=0;
for lp=1:co
    P=in';
    T=ou';
T = ind2vec(T+1);
net = newlvq(minmax(P),10,[.5 .5],0.1);
net.trainParam.epochs = 100;
T1=cputime;
net = train(net,P,T);
tims=[tims;cputime-T1];
a = sim(net,P);
a1=vec2ind(a)
a1= a1-1;
a1 
  cor=0;
    ans=[];
    for i=1:444
        if(a1(i)>0.5)
            ans=[ans;1];
        else
            ans=[ans;0];
        end
        if(a1(i)>0.5)
            if(T(i)==1)
                cor=cor+1;
                tp=tp+1;
            else
                fn=fn+1;
            end
        else
            if(T(i)==0)
                cor=cor+1;
                tn=tn+1;
            else
                fp=fp+1;
            end
        end
    end
    ans;
    cor=cor*100/444;
    trn=[trn;cor];
  
    p=tein';
    t=teou';
   a1 = sim(net,p);
    a1
    cor=0;
    ans=[];
    for i=1:239
        if(a1(i)>0.5)
            ans=[ans;1];
        else
            ans=[ans;0];
        end
        if(a1(i)>0.5)
            if(T(i)==1)
                cor=cor+1;
                tp2=tp2+1;
            else
                fn2=fn2+1;
            end
        else
            if(T(i)==0)
                cor=cor+1;
                tn2=tn2+1;
            else
                fp2=fp2+1;
            end
        end
    end
    ans;
    cor=cor*100/239;
    test=[test;cor];
end
trn
test
[sum(trn)/co sum(test)/co max(trn) max(test) min(trn) min(test)]
tims
sum(tims)/co
[tp/(tp+fn) tn/(tn+fp) (tp+tn)/(tp+tn+fp+fn) (fp)/(tp+fp)  (fn)/(fn+tn)  (tp)/(tp+fp) (tn)/(fn+tn) ] 
[tp2/(tp2+fn2) tn2/(tn2+fp2) (tp2+tn2)/(tp2+tn2+fp2+fn2) (fp2)/(fp2+tp2) (fn2)/(fn2+tn2) (tp2)/(tp2+fp2) (tn2)/(fn2+tn2)]
[tp tn fp fn]/co
[tp2 tn2 fp2 fn2]/co
 


