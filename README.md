# Matlab
Repozytorium projektów matlab realizowanych głównie na zajęciach Metod Numerycznych.

## Interpolacja
Celem projektu było napisanie kodu realizującego interpolacje - tworzenie odwzorowania funkcji bazowej za pomocą danych węzłów interpolacji. Projekt korzysta z interpolacji Lagrange'a.

### Kod
Pierwszy fragment dotyczy analizowanej funkcji. Przykładowo:  
<p align="center">
  f(x)=100*log(x+5)
</p>
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

## Aproksymacja
Celem projektu było napisanie kodu realizującego aproksymacje wielomianową i najmniejszych kwadratów na podstawie zadanej funkcji i wybranej liczby punktów.

### Wyniki
Aproksymacja wielomianowa:

|![s3](https://user-images.githubusercontent.com/74370363/165363803-762de49f-8b22-4331-ba25-9eca8c970642.png)|
|:--:|
|Wykres dla stopnia wielomianu 3|
|![b3](https://user-images.githubusercontent.com/74370363/165364003-49d721c1-7303-4722-b49d-1948f21bfe2b.png)|

|![s8](https://user-images.githubusercontent.com/74370363/165363819-073ee521-b931-410f-bd53-3a7188d9676f.png)|
|:--:|
|Wykres dla stopnia wielomianu 8|
|![b8](https://user-images.githubusercontent.com/74370363/165364219-c502a193-03f8-401c-a3ea-0019a7e0787b.png)|


Aproksymacja najmniejszy kwadratów:

|![w2](https://user-images.githubusercontent.com/74370363/165364633-f4750149-cb7d-4b98-9859-1226bd07750d.png)|
|:--:|
|Wykres dla 2 funkcji bazowych|

|![w10](https://user-images.githubusercontent.com/74370363/165364710-1cb16ee2-7b5d-4541-81bd-45fba01477a7.png)|
|:--:|
|Wykres dla 10 funkcji bazowych|

