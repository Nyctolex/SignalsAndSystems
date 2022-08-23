clc;

n= -10000:10000-1 ;
x1=cos(0.2*pi*n);
x2=cos(0.4*pi*n);
x=sinc(n/6);

figure(1);
plot(n,x);
xlabel('n');
title('cosine Wave signal');
xlim([5*-pi 5*pi]);


N = length(n);
X = fftshift(fft(x));
w=2*pi*(0:(N-1))/N;
w2=fftshift(w);
F=unwrap(w2-2*pi);

figure(2)
plot(F,abs(X));
%xticks([-pi -pi/2 -pi/3 -pi/4 -pi/6 0 pi/6 pi/4 pi/3 pi/2 pi ]);
%xticklabels({'-\pi','-1/2\pi','-1/3\pi','-1/4\pi','-1/6\pi','0','1/6\pi','1/4\pi','1/3\pi','1/2\pi','\pi'});
xlabel('Frequency');

x3=ifft(ifftshift(X));
figure(3);
plot(n,x3);
xlabel('n');
xlim([5*-pi 5*pi]);
title('Reconstrusct cosine Wave signal');


H2=abs(fftshift(fft(h2,N)));
Y2=H2.*abs(X);
figure(4)
plot(F,abs(Y2));
xticks([-pi -pi/2 -pi/3 -pi/4 -pi/6 0 pi/6 pi/4 pi/3 pi/2 pi ]);
xticklabels({'-\pi','-1/2\pi','-1/3\pi','-1/4\pi','-1/6\pi','0','1/6\pi','1/4\pi','1/3\pi','1/2\pi','\pi'});
xlabel('Frequency');
title('Y2')

y2=ifft(ifftshift(Y2));
figure(5);
plot(n,y2);
xlabel('n');
title('y2');
xlim([5*-pi 5*pi]);


H3=abs(fftshift(fft(h3,N)));
Y3=H3.*abs(X);

figure(6)
plot(F,abs(Y3));
xticks([-pi -pi/2 -pi/3 -pi/4 -pi/6 0 pi/6 pi/4 pi/3 pi/2 pi ]);
xticklabels({'-\pi','-1/2\pi','-1/3\pi','-1/4\pi','-1/6\pi','0','1/6\pi','1/4\pi','1/3\pi','1/2\pi','\pi'});
xlabel('Frequency');
title('Y3');

y3=ifft(ifftshift(Y3));
figure(7);
plot(n,y3);
xlabel('n');
title('y3');
xlim([5*-pi 5*pi]);

H4=abs(fftshift(fft(h4,N)));
Y4=H4.*abs(X);

figure(8)
plot(F,abs(Y4));
xticks([-pi -pi/2 -pi/3 -pi/4 -pi/6 0 pi/6 pi/4 pi/3 pi/2 pi ]);
xticklabels({'-\pi','-1/2\pi','-1/3\pi','-1/4\pi','-1/6\pi','0','1/6\pi','1/4\pi','1/3\pi','1/2\pi','\pi'});
xlabel('Frequency');title('Y4');

y4=ifft(ifftshift(Y4));
figure(9);
plot(n,y4);
xlabel('n');
title('y4');
xlim([5*-pi 5*pi]);

H6=abs(fftshift(fft(h6,N)));
Y6=H6.*abs(X);

figure(10)
plot(F,abs(Y6));
xticks([-pi -pi/2 -pi/3 -pi/4 -pi/6 0 pi/6 pi/4 pi/3 pi/2 pi ]);
xticklabels({'-\pi','-1/2\pi','-1/3\pi','-1/4\pi','-1/6\pi','0','1/6\pi','1/4\pi','1/3\pi','1/2\pi','\pi'});
xlabel('Frequency');
title('Y6');

y6=ifft(ifftshift(Y6));
figure(11);
plot(n,y6);
xlabel('n');
title('y6');
xlim([5*-pi 5*pi]);






