
clc;
clear;

%constants
for i=1:3
fig_num = 1;

folder = "C:\Users\chris-chen\Documents\TAU\Year C\SIgnals\end project\question 2\output\x"+i+"c\";
relative_sampling = 100;
L = 1000;
%L2 = 10000;
time_lim = 10*pi;


%def
Ts1 = 6;
Ts2 = 6;
Ts3 = 12;
Ts = [Ts1, Ts2, Ts3];

x1  = @(t) sinc(t/6);
x2 = @(t) (sinc(t/12)).^2;
x3 = @(t) cos(pi*t/12);
signals{1} = x1;
signals{2} = x2;
signals{3} = x3;

%Section d
n_vec = -L:L;
N = length(n_vec);

ts = Ts(i);
tc = ts/relative_sampling;
x = signals{i};

ts_axis = n_vec*ts;
tc_axis = n_vec*tc;

Nc = length(tc_axis);
Ns = length(ts_axis);
xc = x(tc_axis);
xs = x(ts_axis);


figure;
plot(tc_axis,xc);
hold on;
stem(ts_axis,xs);
legend({'coninouse signal','sampaled signal'})
xlabel('time');
ylabel('Amplitude');
fig_title = "x"+i+"[n] and x"+i+"(t)";
title(fig_title)
xlim([-time_lim time_lim]);

path = folder+fig_num+".jpg";
saveas(gcf,path);
fig_num= fig_num+1;


ts4 = 4;
ts8 = 8;
x_n_1 = x(n_vec);
x_n_4 = x(ts4*n_vec);
x_n_8 = x(ts8*n_vec);

fft1 = fftshift(fft(x_n_1, N));
fft2 = fftshift(fft(x_n_4, N));
fft3 = fftshift(fft(x_n_8, N));
k = -N/2:N/2-1;
omega_scale= linspace(-pi,pi,N);


ts = 1;
fs = 1/ts;
%omega_scale = k*fs/N;
figure;
plot(omega_scale, abs(fft1));
xlabel('omega [rad]');
ylabel('Amplitude');
title("fft of x"+i+"for Ts=1")
xlim([-pi pi]);

path = folder+fig_num+".jpg";
saveas(gcf,path);
fig_num= fig_num+1;

figure;
ts = ts4;
fs = 1/ts;
%omega_scale = k*fs/N;
plot(omega_scale, abs(fft2));
xlabel('omega [rad]');
ylabel('Amplitude');
title("fft of x"+i+"for Ts=4")

path = folder+fig_num+".jpg";
saveas(gcf,path);
fig_num= fig_num+1;

figure;
ts = ts8;
fs = 1/ts;
%omega_scale = k*fs/N;
plot(omega_scale, abs(fft3));
xlabel('omega [rad]');
ylabel('Amplitude');
title("fft of x"+i+"for Ts=8")

path = folder+fig_num+".jpg";
saveas(gcf,path);
fig_num= fig_num+1;

%Section e
figure;
ts = 1;
t = -L:ts:L;

plot(t, xres(x, t, ts),'-o');
hold on;
plot(t, x(t), '-+');
legend({'xr', 'x'});
xlabel('Time');
title("x"+i+"r for ts="+ts)
xlim([-time_lim time_lim]);

path = folder+fig_num+".jpg";
saveas(gcf,path);
fig_num= fig_num+1;

figure;
ts = ts4;
plot(t, xres(x, t, ts), '-o');
hold on;
plot(t, x(t), '-+');
legend({'xr', 'x'});
xlabel('Time');
title("x"+i+"r for ts="+ts)
xlim([-time_lim time_lim]);


path = folder+fig_num+".jpg";
saveas(gcf,path);
fig_num= fig_num+1;


figure;
ts = ts8;
plot(t, xres(x, t, ts),'-o');
hold on;
plot(t, x(t), '-+');
legend({'xr', 'x'});
xlabel('Time');
title("x"+i+"r for ts="+ts)
xlim([-time_lim time_lim]);

path = folder+fig_num+".jpg";
saveas(gcf,path);
fig_num= fig_num+1;

end
 function ans=xres(x, t,ts)
        ans=zeros(1,length(t));
        for n2=-length(t)/2:length(t)/2
            ans=ans+x(ts*n2)*sinc((t-n2*ts)/ts);
        end
 end