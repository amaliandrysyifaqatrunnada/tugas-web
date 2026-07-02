# Vendo.id - Quick Start Guide

## ⚡ Setup Cepat (5 Menit)

### Step 1: Clone & Install
```bash
git clone <repo-url>
cd vendo.id
npm install
```

### Step 2: Setup Supabase

1. **Buat Project Supabase** (gratis)
   - Kunjungi [supabase.com](https://supabase.com)
   - Sign up dan buat project baru
   - Tunggu ~30 detik untuk initialize

2. **Setup Database**
   - Buka SQL Editor di Supabase Dashboard
   - Copy-paste isi dari `db/schema.sql`
   - Execute

3. **Ambil Credentials**
   - Settings → API
   - Simpan `Project URL` dan `anon public key`
   - Simpan juga `service_role key`

### Step 3: Konfigurasi `.env`

Rename `.env.example` ke `.env` dan isi:

```env
# Backend
PORT=5000
NODE_ENV=development

# Supabase
VITE_SUPABASE_URL=https://xxxxx.supabase.co
VITE_SUPABASE_ANON_KEY=eyJxxx...
SUPABASE_SERVICE_ROLE_KEY=eyJxxx...

# JWT
JWT_SECRET=super_secret_random_key_change_this
JWT_EXPIRE=7d

# App
APP_URL=http://localhost:5000
```

### Step 4: Jalankan Project

**Terminal 1 - Backend:**
```bash
npm run dev
# Output: 🚀 Server running at http://localhost:5000
```

**Terminal 2 - Frontend:**
```bash
npm run dev:frontend
# Output: VITE v4.x.x ready in xxx ms
# Local: http://localhost:5173/
```

### Step 5: Buka di Browser
- Frontend: http://localhost:5173
- Backend API: http://localhost:5000/api

## ✅ Testing

### 1. Test Signup
- Buka http://localhost:5173
- Klik "Daftar"
- Isi form dengan data dummy
- Submit

### 2. Test Login
- Klik "Masuk"
- Gunakan email & password dari step 1
- Submit

### 3. Test Browse Events
- Dashboard otomatis tampil jika ada events
- Atau pergi ke `/events`

### 4. Test Create Event
- Login terlebih dahulu
- Klik "Buat Acara"
- Isi form & submit
- Event akan langsung tampil di dashboard

## 🐛 Troubleshooting Cepat

### Error: "Cannot connect to Supabase"
✅ Solusi: 
- Cek apakah `VITE_SUPABASE_URL` dan key sudah benar
- Jangan ada space di value `.env`
- Restart terminal setelah edit `.env`

### Error: "Module not found"
✅ Solusi:
```bash
rm -rf node_modules package-lock.json
npm install
```

### Frontend tidak connect ke Backend
✅ Solusi:
- Pastikan backend running di port 5000
- Check di browser console untuk error
- API calls pergi ke `/api/...` (proxy di vite.config.js)

### Supabase Table Kosong
✅ Solusi:
- Jalankan schema.sql di SQL Editor
- Check apakah ada error di execution

## 📚 Dokumentasi Lengkap

Lihat [README.md](./README.md) untuk dokumentasi lengkap

## 🎯 Next Steps

Setelah setup berhasil:

1. ✅ Explore UI di browser
2. ✅ Buat beberapa test events
3. ✅ Test booking functionality
4. ✅ Check admin dashboard
5. ✅ Customize sesuai kebutuhan

## 🚀 Production Deployment

### Frontend (Vercel/Netlify)
```bash
npm run build
# Upload `dist` folder
```

### Backend (Railway/Render/Heroku)
```bash
# Set environment variables di platform
npm start
```

---

**Butuh bantuan?** Lihat troubleshooting di README.md atau hubungi team
