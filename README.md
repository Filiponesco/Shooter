Authors: Filip Gaweł, Piotr Białas

Silesian University of technology faculty of applied mathematic III semester - project

## Część I
- **Opis programu**
  Zombie shooter jest obiektowym programem w formie gry. Na ekranie wyświetlany jest czerwony kwadrat – gracz, zielone koła – zombie. Poprzez naciskanie na klawiaturze odpowiednich przycisków gracz może się poruszać, a po naciśnięciu lewego przycisku myszy gracz oddaje strzał w kierunku kursora. Gra polega na przechodzeniu kolejnych rund, aby przejść rundę należy zabić wszystkie zombie i zachować życie. Zombie zawsze kieruje się w stronę gracza i gdy się z nim dotknie zaczyna go atakować odbierając mu życie. Dodatkowo gracz może zbierać pojawiające się na ekranie dodatkowe super moce, które są pomocne do przejścia rundy. Do obsługi programu wystarczy komputer z systemem operacyjnym Windows XP lub nowszym.

- **Instrukcja obsługi**    
rys.1
   
![alt text](https://github.com/Filiponesco/Shooter/blob/master/documentation/keys.jpg)   
  Aby zagrać w grę konieczne jest posiadanie pliku zombie\_shooter.exe. Do poruszania się graczem używamy klawiatury tak jak to pokazano na _rys.1_ (kolor niebieski).

  W celu oddania strzału należy nakierować kursor w miejsce, gdzie chcemy oddać strzał, a następnie nacisnąć lewy przycisk myszy. Jeden magazynek pistoletu posiada 12 naboi, gdy chcemy przeładować należy nacisnąć klawisz &#39;r&#39; na klawiaturze &#39;qwerty&#39; . Proces przeładowania trwa jedną sekundę. _patrz rys.1._

- **WYGLĄD GŁÓWNEGO EKRANU**  
   
![alt text](https://github.com/Filiponesco/Shooter/blob/master/documentation/display.jpg)
  W prawym dolnym rogu okienka pokazywany jest poziom życia gracza oraz wartość tarczy, oznaczone jako &#39;HP&#39; oraz &#39;SH&#39; z ang. &#39;shield&#39; - tarcza. Możemy również odczytać liczbę zabitych zombie w trakcie trwania gry, liczba ta poprzedzona jest tekstem &#39;KILLED&#39;.
W górnej części ekranu znajdują się informacje o aktualnej rundzie oraz broni.
Kolory zombie są bardzo pomocne. W zależności od poziomu życia, zombie zmienia swój kolor z zielonego na czerwony. Zombie w zależności od swojej wielkości posiada odpowiednią szybkość poruszania. Im większe zombie tym porusza się wolniej, ale zadaje więcej obrażeń.

## Część II
### Specyfikacja techniczna

- **Podział projektu na pliki:**
W folderze shooter:

- Shooter.pde

- Player.pde

- Guns.pde

- Bullet.pde

- PowerUp.pde

- Zombie.pde

### Co znajduje się w danym pliku

**Shooter.pde – main**
  - void setup()
  - void draw()
  - void keyPressed()
  - void keyReleased()
  - void mousePressed()
  - void reload()
  - void speed()
  - void push(Player p, Zombie z)
  - boolean birthCollision(int i)
  - void addZombie(int l)
  - void showText()

**Player.pde – klasa gracza**
  - void move()
  - void show()
  - boolean collisionWithPowerUp(float a, float b)
  - void rotating()
  - boolean collisionWtihZombie(Zombie z)

**Guns.pde – klasa broni**
  - boolean shoot()
  - void showAmmo()
  - void reload()

**Bullet.pde – klasa pocisków**
  - void move()
  - void show()
  - void update()
  - boolean outOfRange()

**PowerUp.pde – klasa mocy**
  - void show()
  - void use(Player guy)

**Zombie.pde – klasa zombie**
  - void update()
  - void show()
  - void rotating()
  - void applyForce(PVector force)
  - void applyBehaviors(ArrayList\&lt;Zombie\&gt; zombies)
  - PVector seek(PVector target)
  - PVector separate (ArrayList\&lt;Zombie\&gt; zombies)
  - Boolean intersects(Zombie other)
  - void attack()
  - boolean collisionWithBullets(Bullet b, Zombie z)
  - boolean death(Zombie z)

### Kompilacja projektu: Projekt został stworzony w języku java w frameworku processing w wersji 3.4.

### Szczegóły techniczne

**Algorytmy/fragmenty kodu**

 - Poruszanie się zombie – wykorzystałem algorytm Craig&#39;a Reynolds&#39;a „Steering Behaviors For Autonomous Characters&quot;.

**Metoda, która zwraca wektor, aby zombie kierowało się do gracza**  
   
![alt text](https://github.com/Filiponesco/Shooter/blob/master/documentation/algorithm1.jpg)
   
      
**Metoda sprawdza pobliskie zombie i oddala się od nich**  
   
![alt text](https://github.com/Filiponesco/Shooter/blob/master/documentation/alghorithm2.jpg)  
   
   
**Metoda wykorzystuje metody PVector seek oraz PVector seprate do ruchu zombie oraz wykonuje odpowiednie kroki w przypadku kolizji z graczem**
   
![alt text](https://github.com/Filiponesco/Shooter/blob/master/documentation/alghorithm3.jpg)   
   
   
**Metoda dodaje do wektoru acceleration konkretny wektor**
   
![alt text](https://github.com/Filiponesco/Shooter/blob/master/documentation/alghorithm4.jpg)   
