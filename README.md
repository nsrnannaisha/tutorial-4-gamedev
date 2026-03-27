# Tutorial Game Development 🎮
Nama  : Nisrina Annaisha Sarnadi  
NPM   : 2306275960

## Tutorial 4 - Basic 2D Level Design

### TileMap
- Dibuat TileMapLayer baru dengan TileSet
- Layout level memiliki lebih banyak jurang dan gap antar platform yang lebih bervariasi dari Level 1

### Player
- Instance `Player.tscn` ditambahkan sebagai child dari node Level2 beserta dengan Camera2D
- Posisi player diletakkan di platform awal

### Lose Area (Jatuh ke Jurang)
- Instance `AreaTrigger.tscn` ditambahkan di bawah seluruh level
- `sceneName` diset ke `Level2` agar player mengulang level yang sama ketika jatuh
- CollisionShape dibuat memanjang menutupi seluruh lebar level

### Win Area (Finish)
- Instance `AreaTrigger.tscn` ditambahkan di ujung level sebagai goal
- `sceneName` diset ke `WinScreen`
- Diletakkan sebagai child dari Sprite2D roket sebagai penanda finish

### Obstacle Star
Obstacle berupa bintang yang jatuh dari atas. Struktur scene `Star.tscn`:
Ditambahkan script dengan rotasi acak agar terlihat natural.

### Spawner
- Node **Spawner** ditambahkan di bagian atas layar Level 2
- `obstacle` diset ke `Star.tscn`
- Meteor di-spawn setiap 2 detik di posisi acak sepanjang level

### Konfigurasi & Pengaturan
- Collision layer/mask disesuaikan agar Area2D meteor dapat mendeteksi Player
- Ukuran CollisionShape pada Area2D meteor disesuaikan agar menutupi seluruh sprite
- Posisi Spawner diatur agar meteor jatuh dari luar viewport (atas layar)

### Transisi kevel
Menambahkan transisi dari level yang ada pada tutorial ke  level 2 untuk latihan mandiri. 
Transisi muncul ketika player berhasil mencapai Win Area dan ```WinScreen``` dipanggil.
Transisi dibuat dengan menambahkan script pada scene ```WinScreen.tscn``` untuk dapat transisi ke level 2 setelah sprite2d muncul.

## Tutorial 6 - Menu and In-Game Graphical User Interface

### Main Menu
 
#### Struktur Scene
- Dibuat scene baru `MainMenu.tscn` dengan root node `MarginContainer`
- Layout diatur ke **Full Rect** agar menyesuaikan ukuran window
- Struktur container: `MarginContainer` → `HBoxContainer` → `VBoxContainer` (kiri: judul + tombol) + `CenterContainer` (kanan: gambar)
 
#### Label & LinkButton
- Node `Label` ditambahkan untuk judul game
- Dua node `LinkButton` ditambahkan: **New Game** dan **Stage Select**
- Font diubah melalui **ThemeOverrides** menggunakan file `CC Wild Words Roman.ttf`
 
#### Gambar
- Node `TextureRect` ditambahkan di dalam `CenterContainer`
- Texture diisi dengan `spritesheet_alien.png`
- `Expand Mode` diset ke **Ignore Size**, `Stretch Mode` ke **Keep Aspect Centered**
 
#### Layout & Alignment
- `HBoxContainer` Alignment diset ke **Center**
- `VBoxContainer` Container Sizing Vertical diset ke **Shrink Center**
- Separation pada ThemeOverrides diatur agar jarak antar elemen tidak terlalu rapat
 
### Clickable Menu
 
#### Script LinkButton
- Script `StartGame.gd` dibuat dan ditempelkan pada masing-masing `LinkButton`
- Menggunakan `@export var scene_to_load: String` agar nama scene bisa diisi dari Inspector
- Fungsi `_on_New_Game_pressed()` memanggil `get_tree().change_scene_to_file()` untuk berpindah scene 
- Signal `pressed()` dihubungkan ke fungsi tersebut melalui tab **Node > Signals**
- Variabel `scene_to_load` diisi di Inspector sesuai scene tujuan (contoh: `Level 1`)
- Main Scene diubah ke `MainMenu.tscn` melalui **Project > Project Settings > Application > Run > Main Scene**
 
### GUI Life Counter
 
#### Global Variable
- Script `Global.gd` dibuat di folder `scripts`
- Script ditambahkan ke **Autoload** melalui **Project > Project Settings > Autoload** agar dapat diakses dari script manapun
 
#### Scene Life Counter
- Scene baru `LifeCounter.tscn` dibuat dengan root node `MarginContainer` dan child node `Label`
- Script pada `Label` memperbarui teks setiap frame untuk menampilkan nilai `Global.lives` 
- `LifeCounter.tscn` ditambahkan sebagai child dari node `CanvasLayer` di scene Level 1
 
#### Pengurangan Nyawa
- Script `Area2D.gd` diperbarui agar `Global.lives` berkurang saat player menyentuh area trigger
- Pengecekan scene saat ini dilakukan agar nyawa hanya berkurang saat reload scene yang sama (bukan saat transisi ke level lain)
 
### Layar Game Over
- Scene baru `GameOver.tscn` dibuat dengan root node `ColorRect` berlatar merah
- Layout diatur ke **Full Rect**, lalu node `Label` bertuliskan "GAME OVER" ditambahkan
- Script `Area2D.gd` diperbarui: saat `Global.lives == 0`, game berpindah ke `GameOver.tscn`
 
### Penambahan Fitur
 
#### Tombol Kembali ke Main Menu dari Game Over
Dilakukan perubahan pada scene game over dengan memodifikasi node menjadi `HBoxContainer` didalamnya terdapat `VBoxContainer`, `Label`, `CenterContainer`, `TextureRect`, dan `LinkButton`.    
- Node `LinkButton` ditambahkan pada scene `GameOver.tscn` dengan teks "Back to Menu"
- Script yang sama (`StartGame.gd`) digunakan, dengan `scene_to_load` diisi `MainMenu`
- Signal `pressed()` dihubungkan ke fungsi handler di script tersebut
 
#### Fitur Select Stage
Dibuat scene baru agar ketika button `Stage Level` pada Main Menu dapat di klik. Button ini akan mengarahkan ke halaman Select Stage yang didalamnya terdapat pilihan level dan button `Back`.    
- Tombol **Stage Select** di Main Menu dihubungkan ke scene `SelectLevel.tscn`
- Scene `SelectLevel.tscn` dibuat dengan daftar `LinkButton` untuk tiap level yang tersedia
- Masing-masing tombol menggunakan script `StartGame.gd` dengan `scene_to_load` diisi nama scene level tujuan (contoh: `Level 1`, `Level 2`)
- Tombol **Back** pada scene SelectLevel dihubungkan kembali ke `MainMenu`
 
### Referensi
- [Tutorial_6_Game_Development](https://csui-game-development.github.io/tutorials/tutorial-6/)

### Assets
- [Font_Title](https://www.1001fonts.com/pixel-game-font.html)
- [Font_Subtitle](https://www.1001fonts.com/motion-control-font.html)
