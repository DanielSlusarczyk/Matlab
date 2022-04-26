# Matlab
Repozytorium projektów matlab realizowanych głównie na zajęciach Metod Numerycznych.

## Interpolacja
Celem projektu było napisanie kodu realizującego interpolacje - tworzenie odwzorowania funkcji bazowej za pomocą danych węzłów interpolacji. Projekt korzysta z interpolacji Lagrange'a.

## Kod
Pierwszy fragment dotyczy analizowanej funkcji. Przykładowo: <\br>
f(x)=100*log(x+5).
W tej części obliczane są argumenty i wartości funkcji dla zakresu <-4,4>  i l_arg punktów. Kolejnym etapem jest obliczenie współrzędnych wybranej ilości num_w węzłów interpolacyjnych na podstawie analizowanej funkcji. Otrzymane węzły interpolacyjne są przesyłane do funkcji laggr() wraz ze zmienną l_arg określającą ile punktów ma zawierać nowa funkcja interpolacyjna. Funkcja interpolacyjna wyznacza przebieg interpolacji. Następnym krokiem jest zaprezentowanie otrzymanych danych w formie wykresu.

|![w2](https://user-images.githubusercontent.com/74370363/165354438-9f8048fe-0b45-4853-a8b4-366070f5e8c1.png)|
|:--:|
|Wykres dla dwóch węzłów|
|![w2b](https://user-images.githubusercontent.com/74370363/165355282-facf269a-865a-4d2e-b578-0fdd7b0fcc04.png)|

|![w5](https://user-images.githubusercontent.com/74370363/165355643-476b78c0-4835-4b9f-8606-3e5bf959a569.png)|
|:--:|
|Wykres dla pięciu węzłów|
|![w5b](https://user-images.githubusercontent.com/74370363/165355655-02e1f665-a719-4867-be3f-14e5ec8907e1.png)|


Wykres zawiera wykres funkcji wzorcowej f(x) danej w zadaniu, funkcji interpolacyjnej i(x) i węzłów interpolacyjnych. Ostatnim etapem jest obliczenie błędów: maksymalnego i średniego. Etap ten pozwala na wybranie ilości l_pkt punktów, które mają zostać przeanalizowane w liczeniu błędów. Wartość l_pkt bezpośrednio wpływa na dokładność wyniku. Kod oblicza nowe wartości funkcji f(x) i i(x) dla wybranej ilości punktów l_pkt i dokonuje obliczeń błędów zgodnie ze wzorami. Dokładniejsza analiza kodu została również zawarta z kodem źródłowym w formie komentarzy.


