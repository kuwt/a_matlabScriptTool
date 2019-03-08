% 
% %%%%%%%%%%%%%%%%%%% Example 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fs = 1000;                    % Sampling frequency
% T = 1/Fs;                     % Sample time
% L = 1000;                     % Length of signal
% t = (0:L-1)*T;                % Time vector
% % Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
% x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t); 
% y = x + 2*randn(size(t));     % Sinusoids plus noise
% figure
% subplot(2,1,1)
% plot(1000*t(1:50),x(1:50))
% title('Sinusoids Signal')
% xlabel('time (milliseconds)')
% subplot(2,1,2)
% plot(1000*t(1:50),y(1:50))
% title('Signal Corrupted with Zero-Mean Random Noise')
% xlabel('time (milliseconds)')
% 
% Y = fft(y);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% 
% figure
% plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% Y = fft(x);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% 
% figure
% plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of S(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% 
% 
% %%%%%%%%%%%%%%% example 2 %%%%%%%%%%%%%%%%
% Fs = 100;           % Sampling frequency
% t = -0.5:1/Fs:0.5;  % Time vector 
% L = length(t);      % Signal length
% 
% X = 1/(4*sqrt(2*pi*0.01))*(exp(-t.^2/(2*0.01)));
% figure
% plot(t,X)
% title('Gaussian Pulse in Time Domain')
% xlabel('Time (t)')
% ylabel('X(t)')
% 
% n = 2^nextpow2(L);
% Y = fft(X,n);
% f = Fs*(0:(n/2))/n;
% P = abs(Y/n);
% figure
% plot(f,P(1:n/2+1)) 
% title('Gaussian Pulse in Frequency Domain')
% xlabel('Frequency (f)')
% ylabel('|P(f)|')
% 
% Preal = real(Y/n);
% Pimag = imag(Y/n);
% figure
% plot(f,Preal(1:n/2+1)) 
% title('Gaussian Pulse(real) in Frequency Domain')
% xlabel('Frequency (f)')
% ylabel('Preal')
% figure
% plot(f,Pimag(1:n/2+1)) 
% title('Gaussian Pulse(imag) in Frequency Domain')
% xlabel('Frequency (f)')
% ylabel('PIm')
% %%%%%%%%%%%%%%% example 3 %%%%%%%%%%%%%%%%
% Fs = 1000;                    % Sampling frequency
% T = 1/Fs;                     % Sampling period
% L = 1000;                     % Length of signal
% t = (0:L-1)*T;                % Time vector
% 
% x1 = cos(2*pi*50*t);          % First row wave
% x2 = cos(2*pi*150*t);         % Second row wave
% x3 = cos(2*pi*300*t);         % Third row wave
% 
% X = [x1; x2; x3];
% 
% figure
% for i = 1:3
%     subplot(3,1,i)
%     plot(t(1:100),X(i,1:100))
%     title(['Row ',num2str(i),' in the Time Domain'])
% end
% n = 2^nextpow2(L);
% dim = 2;
% Y = fft(X,n,dim);
% P2 = abs(Y/L);
% P1 = P2(:,1:n/2+1);
% P1(:,2:end-1) = 2*P1(:,2:end-1);
% figure
% for i=1:3
%     subplot(3,1,i)
%     plot(0:(Fs/n):(Fs/2-Fs/n),P1(i,1:n/2))
%     title(['Row ',num2str(i),' in the Frequency Domain'])
% end

% %%%%%%%%%%%%%%% example 4 %%%%%%%%%%%%%%%%
f = zeros(30,30);
f(5:24,13:17) = 1;
figure
imshow(f,'InitialMagnification','fit')

F = fft2(f);
F2 = log(abs(F));
figure;
imshow(F2,[-1 5],'InitialMagnification','fit');
colormap(jet); colorbar

F = fft2(f,256,256);
figure;
imshow(log(abs(F)),[-1 5]); colormap(jet); colorbar

F = fft2(f,256,256);F2 = fftshift(F);
imshow(log(abs(F2)),[-1 5]); colormap(jet); colorbar