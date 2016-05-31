%%a

y=[1;2;3;4;5]    %y is an array
y2=flipud[y1]

%%b

N=10000
for n=N+1:length(y)
    y3(n)=y(n)+y(n-N)
end

%%c

'wave'='wave2'          %have 2 equivalent files
for n=2:length('wave')  %edit wave
  wave2(n,1)=.9*wave2(n-1,1)+wave(n,1) %left
  wave2(n,2)=.9*wave2(n-1,2)+wave(n,2) %right
  
end

%%d

soundsc('wave',fs/1.5) %wave is the filee
                       %the divisor changes the speed
                       
%%e
soundsc(left,fs)
soundsc(left-right,fs)

