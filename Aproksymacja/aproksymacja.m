%% Wstep
% wyczysc workspace, zamknij okna
clc
clear
close all

% Dana funkcja:
funkcja = @(x)exp(x)+cos(3*x)-sin(x);

%% Wykres funkcji:
% Liczba argumentów funkcji
l_arg = 200;

% Argumenty funkcji
X = linspace(-2,2,l_arg);

% Wartości funkcji
Y = funkcja(X);

%% Węzły aproksymacji:
% Liczba węzłów aproksymacji
num_w = 20;

% Argumenty węzłów aproksymacji
W_x = linspace(-2, 2, num_w);

% Wartości węzłów aproksymacji
W_y = funkcja(W_x);

%% Aproksymacja wielomianowa
% funkcja aproksymująca n-stopnia:
n = 10;

[xdn, ydn] = approximation(W_x, W_y, n);

% Wykres
plot(W_x, W_y, 'or', X, Y,'b', xdn, ydn)
legend('Punkty','Funkcja wzorcowa f(x)', strcat('Aproksymacja stopnia:', num2str(n)))
xlabel('x')
ylabel('y')

%% BŁĘDY:
l_pkt = 200;
% Błąd maksymalny
X = linspace(-2, 2, l_pkt);                 % Wyznaczenie l_pkt nowych argumentów x dla błędów
Y = funkcja(X);                             % Wyznaczenie wartości funkcji
E = abs(Y - ydn);                           % Obliczenie modułu z różnicy wartości danej funkcji i funkcji interpolacyjnej
blad_maks = max(E);                         % Wyznaczneie maksymalnego modułu
fprintf('Błąd maksymalny: %f\n', blad_maks)

%Błąd średni
sigma = 0;

for e = 1:(length(X)-1)
    sigma = sigma + (E(e) + E(e + 1))/2;
end

blad_sredni = (1/(l_arg - 1))*sigma;        % Obliczenie błędu średniego zgodnie ze wzorem
fprintf('Błąd średni: %f\n', blad_sredni)


%% Aproksymacja najmniejszy kwadratów z zestawem funkcji bazowych
approx(W_x, W_y, 10)

%% Funkcja aproksymująca
function [xd, yd] = approximation(x, y, n)
    A = [];
    b = [];
    a = [];
    for r = 1:n
        for c = 1:n
            A(r,c) = sum(x.^(r+c-2));
        end
        b(r,1) = sum(y.*x.^(r-1)); 
    end
    a = A\b;
    xd = linspace(min(x), max(x), 200);
    yd = zeros(size(xd));
    for i = 1:n
        yd = yd + a(i) * xd.^(i-1);
    end

    fprintf('Dla n: %f\n', n)
    for k = 1:n
        fprintf('Wektor a: %f \n', a(k, 1))
    end
end

function y = p0(x)
 y = x.*x.*sin(x);
end
function y = p1(x)
 y = x.*x.*cos(x);
end
function y = p2(x)
 y = exp(x);
end
function y = p3(x)
 y = exp(-x);
end
function y = p4(x)
 y = x.*sin(x);
end
function y = p5(x)
 y = x.*cos(x);
end
function y = p6(x)
 y = sin(x);
end
function y = p7(x)
 y = cos(x);
end
function y = p8(x)
 y = sin(4*x);
end
function y = p9(x)
 y = cos(4*x);
end

function approx(xp, yp, n)
    scale = 2/(max(xp) - min(xp));
    ofset = -1 - scale * min(xp);
    xps = scale * xp + ofset;
    N = length(xps);
    A = zeros(n);
    b = zeros(n,1);
    p = {@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9};
    for r = 1:n
        for c = 1:n
            A(r,c) = sumuj(xps, p{r}, p{c});
        end
        b(r) = sumujb(xps, yp, p{r});
    end
    a = A\b;
    xd = linspace(min(xp),max(xp),50);
    yd = legendre(a, p, xd*scale + ofset);
    figure
    plot(xp, yp, 'o', xd, yd)
    legend('Punkty aproksymacji','Aproksymacja')
    xlabel('x')
    ylabel('y')
end
function y = legendre(a, p, xd)
    y = zeros(size(xd));
    for i = 1:length(a)
        y = y + a(i) * p{i}(xd);
    end
end
function s = sumuj(xp, pa, pb)
    s = 0;
    for j = 1:length(xp)
        s = s + pa(xp(j)) * pb(xp(j));
    end
end
function s = sumujb(xp, yp, pa)
    s = 0;
    for j = 1:length(xp)
        s = s + yp(j) * pa(xp(j));
    end
end
