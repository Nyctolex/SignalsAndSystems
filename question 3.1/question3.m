close all
clc
clear
%constants
folder = "C:\Users\chris-chen\Documents\TAU\Year C\SIgnals\end project\question 3\output\";

fig_num = 1;
Ks = [5, 10];
Ns = [20, 50];
i  = 1;

for i = 1:2
%% section c
figure;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1 0.1 0.8 0.8]);
N = Ns(i);
x_vec = ones(1, N);
t = 0:1:length(x_vec)-1;
subplot(2,1,1);
stem(t, x_vec);
xlabel('n');
ylabel('x[n]');
title(compose("x[n] for N=%d",N));
ylim([0, 1.5]);

subplot(2,1,2);
%fft_xn = fftshift(fft(x_vec));
fft_xn = fft(x_vec);
%omega_scale= linspace(-pi,pi,length(x_vec)) - pi/length(x_vec);
%omega_scale= linspace(-min(x_vec),pi,length(x_vec))
omega_scale = t;
stem(omega_scale, abs(fft_xn))
xlabel('k');
ylabel('|X[k]|');
title(compose("|X[k]| for N=%d",N));
%xlim([-pi, pi]);
path = folder+fig_num+".jpg";
saveas(gcf,path);
fig_num= fig_num+1;

%% section d
figure;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1 0.1 0.8 0.8]);
N = 50;
K = Ks(i);
x_pad = [ones(1, N) zeros(1, K)];
t = 0:1:length(x_pad)-1;
subplot(2,1,1);
stem(t, x_pad);
xlabel('n');
ylabel('x[n]');
title(compose("x[n] for N=%d, K=%d",N, K));
ylim([0, 1.5]);
subplot(2,1,2);
%fft_xn = fftshift(fft(x_pad));
fft_xn = fft(x_pad)
%omega_scale= linspace(-pi,pi,length(x_pad))- pi/length(x_vec);
omega_scale=t;
stem(omega_scale, abs(fft_xn))
xlabel('k');
ylabel('|X[k]|');
title(compose("|X[k]| for N=%d, K=%d",N, K));
xlim([0, max(t)]);


path = folder+fig_num+".jpg";
saveas(gcf,path);
fig_num= fig_num+1;
end

