%% Wstep
% wyczysc workspace, zamknij okna
clc
clear
close all

% Dana funkcja:
% funkcja = @(x)-x.*x.*x + 3 * x.*x + x - 5;
funkcja = @(x)100*log(x + 5);

%% Wykres funkcji:
% Liczba argumentów funkcji
l_arg = 200;

% Argumenty funkcji
X = linspace(-4,4,l_arg);

% Wartości funkcji
Y = funkcja(X);

%% Węzły interpolacji:
% Liczba węzłów interpolacji
num_w = 10;

% Argumenty węzłów
W_x = linspace(-4, 4, num_w);

% Wartości węzłów interpolacji
W_y = funkcja(W_x);

%% Interpolacja
% Obliczenie wartości funkcji interpolacyjnej:
[I_x, I_y] = laggr(W_x, W_y, l_arg);

% Wykres
plot(W_x, W_y, 'or', X, Y,'b', I_x, I_y)
legend('Węzły interpolacji','Funkcja wzorcowa f(x)', 'Interpolacja i(x)')
xlabel('x')
ylabel('y')

%% BŁĘDY:
l_pkt = 200;
% Błąd maksymalny
X = linspace(-4, 4, l_pkt);                 % Wyznaczenie l_pkt nowych argumentów x dla błędów
Y = funkcja(X);                             % Wyznaczenie wartości funkcji
[I_x, I_y] = laggr(W_x, W_y, l_pkt);        % Wyznaczanie l_pkt nowych arugmentów i wartości funkcji interpolacyjnej
E = abs(Y - I_y);                           % Obliczenie modułu z różnicy wartości danej funkcji i funkcji interpolacyjnej
blad_maks = max(E);                         % Wyznaczneie maksymalnego modułu
fprintf('Błąd maksymalny: %f\n', blad_maks)

%Błąd średni
sigma = 0;
for e = 1:(length(X)-1)
    sigma = sigma + (E(e) + E(e + 1))/2;
end

blad_sredni = (1/(l_arg - 1))*sigma;        % Obliczenie błędu śreniego zgodnie ze wzorem
fprintf('Błąd średni: %f\n', blad_sredni)

%% Funkcja interpolacyjna
function[xd, yd] = laggr(x, y, l_arg)
    n = length(x);                          % Długość wektora argumentów -> n
    xd = linspace(min(x),max(x), l_arg);    % Wektor z równomiernie rozłożnymi l_arg wartościami z pdziedziału min(x), max(x) -> xd
    yd = zeros(1, length(xd));              % Wektor zerowy -> yd
    for k = 1:length(xd)
        xval = xd(k);
        s = 0;
        for i = 1:n
            p = 1;
            for j = 1:n
                if (i ~= j)                 % Pominięcie wartości x = x_i, ponieważ wynikiem zawsze byłoby 0
                p = p * (xval - x(j)) / (x(i) - x(j));
                end
            end
            s = s + y(i) * p;
        end
        yd(k) = s;
    end
end
