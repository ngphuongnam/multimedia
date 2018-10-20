%Da_Phuong_Tien
%SV: Nguyen_Phuong_Nam mssv: 20152577
%bai1
r= audiorecorder(44100,16,1);
disp('bat dau ghi am');
recordblocking(r,6);
disp('ket thuc');
r1 = getaudiodata(r,'int16');
audiowrite('orig_input.wav',r1,44100);
y= audioread('orig_input.wav');
soundsc(y,44100);
%bai2
fs = 44100; 
t = 1/fs : 1/fs : 1.5; 
f1 = 432; 
f2 = 484;
f3 = 256;
f4 = 324;
A1 = .3; A2 = A1/2; A3 = A1/3; A4 = A1/4;
y = y';
y1 = A1 * sin( 2 * pi * f1 * t  );
y2 = A2 * sin( 2 * pi * f2 * t  );
y3 = A3 * sin( 2 * pi * f3 * t  );
y4 = A4 * sin( 2 * pi * f4 * t  );
y5 = [y1 y2 y3 y4];
y6 = y5 + y;
audiowrite('melody.wav',y6,fs);
%bai3
N = length(y6);
transform = fft(y6,N)/N;
magTransform = abs(transform);

faxis = linspace(-N/2,N/2,N);
figure(1);
plot(faxis,fftshift(magTransform));
title('The Spectrum');
xlabel('Frequency (Hz)');
%bai4
figure(2);
win = 128;

hop = win/2;            

nfft = win;
spectrogram(y6,win,hop,nfft,fs,'yaxis');
yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt));
title('Spectrogram');