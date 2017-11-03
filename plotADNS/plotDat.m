dbstop if error
clear all

arduino = serial('COM3');
arduino.InputBufferSize = 1;
arduino.BaudRate = 115200;
try 
    fopen(arduino)
catch err
    fclose(instrfind);
    error('incorect com port')
end

Tmax = 30;
figure
grid on;
xlabel('Time(s)');
Ts = 0.001; i = 0; data = 0; t = 0;

pause(5);
tic;

%% image quality
ylabel('Image Quality');
while toc <= Tmax
    i = i +1;
    data(i) = fread(arduino);
    timeS(i) = toc;
    t(i) = toc;
    if i > 1
        T = toc - t(i-1);
        while T <Ts
            T = toc - t(i-1);
        end
    end
    t(i) = toc;
    if i > 1
        axis([toc-5 toc+5 0 255]);
        line([t(i-1) t(i)],[data(i-1) data(i)])
        drawnow
    end

end


% %% dx
% ylabel('Delta x');
% while toc <= Tmax
%     i = i +1;
%     data(i) = fread(arduino);
%     t(i) = toc;
%     if i > 1
%         T = toc - t(i-1);
%         while T <Ts
%             T = toc - t(i-1);
%         end
%     end
%     t(i) = toc;
%     if i > 1
%         axis([toc-5 toc+5 -128 128]);
%         line([t(i-1) t(i)],[data(i-1) data(i)])
%         drawnow
%     end
% end
% 
% %% dy
% ylabel('Delta y');
% while toc <= Tmax
%     i = i +1;
%     data(i) = fread(arduino);
%     t(i) = toc;
%     if i > 1
%         T = toc - t(i-1);
%         while T <Ts
%             T = toc - t(i-1);
%         end
%     end
%     t(i) = toc;
%     if i > 1
%         axis([toc-5 toc+5 -128 128]);
%         line([t(i-1) t(i)],[data(i-1) data(i)])
%         drawnow
%     end
% end
% 
% %% shutter speed
% ylabel('Shutter Speed');
% while toc <= Tmax
%     i = i +1;
%     data(i) = fread(arduino);
%     t(i) = toc;
%     if i > 1
%         T = toc - t(i-1);
%         while T <Ts
%             T = toc - t(i-1);
%         end
%     end
%     t(i) = toc;
%     if i > 1
%         axis([toc-5 toc+5 0 255]);
%         line([t(i-1) t(i)],[data(i-1) data(i)])
%         drawnow
%     end
% end
% 
% %% max pixel
% ylabel('Max Pixel');
% while toc <= Tmax
%     i = i +1;
%     data(i) = fread(arduino);
%     t(i) = toc;
%     if i > 1
%         T = toc - t(i-1);
%         while T <Ts
%             T = toc - t(i-1);
%         end
%     end
%     t(i) = toc;
%     if i > 1
%         axis([toc-5 toc+5 0 65]);
%         line([t(i-1) t(i)],[data(i-1) data(i)])
%         drawnow
%     end
% end

fclose(arduino);
            