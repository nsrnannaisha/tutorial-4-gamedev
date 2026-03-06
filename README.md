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
