# 🚀 Getting Started Checklist

Ikuti langkah-langkah di bawah untuk mendapatkan aplikasi Vendo.id berjalan dalam 15 menit!

## ✅ Pre-Setup (5 menit)

- [ ] Install Node.js v16+ dari [nodejs.org](https://nodejs.org)
- [ ] Buat account Supabase di [supabase.com](https://supabase.com) (gratis)
- [ ] Clone atau download project ini
- [ ] Buka terminal di folder project

## ✅ Database Setup (5 menit)

- [ ] Buat project baru di Supabase Dashboard
- [ ] Tunggu project selesai initialize (~30 detik)
- [ ] Buka SQL Editor
- [ ] Copy-paste isi dari `db/schema.sql`
- [ ] Click "Run" untuk jalankan schema
- [ ] Tunggu sampai selesai tanpa error

## ✅ Credentials Setup (3 menit)

- [ ] Buka Settings → API di Supabase
- [ ] Copy **Project URL** → simpan untuk VITE_SUPABASE_URL
- [ ] Copy **anon public key** → simpan untuk VITE_SUPABASE_ANON_KEY
- [ ] Copy **service_role key** → simpan untuk SUPABASE_SERVICE_ROLE_KEY
- [ ] Rename `.env.example` menjadi `.env`
- [ ] Edit `.env` dan paste ketiga credentials tersebut
- [ ] Tambahkan JWT_SECRET (bisa asal, random string)

## ✅ Installation (2 menit)

```bash
# Install semua dependencies
npm install

# Tunggu sampai selesai (~1-2 menit)
```

## ✅ Running the App (Seconds!)

**Terminal 1 - Backend:**
```bash
npm run dev
```
Tunggu sampai muncul: `🚀 Server running at http://localhost:5000`

**Terminal 2 - Frontend:**
```bash
npm run dev:frontend
```
Tunggu sampai muncul: `Local: http://localhost:5173`

## ✅ Test di Browser

Buka tab baru dan pergi ke: **http://localhost:5173**

### 1. Test Signup
- [ ] Klik "Daftar"
- [ ] Isi form dengan:
  - Nama: Test User
  - Email: test@example.com
  - Password: Test123456 (minimal 8 karakter)
- [ ] Klik "Daftar Sekarang"
- [ ] Redirect ke login

### 2. Test Login
- [ ] Klik "Masuk"
- [ ] Isi email & password dari signup
- [ ] Klik "Masuk"
- [ ] Harus redirect ke dashboard

### 3. Test Browse Events
- [ ] Klik "Cari Acara"
- [ ] Lihat event list (mungkin kosong, itu normal)

### 4. Test Create Event
- [ ] Klik "Buat Acara" (di navbar)
- [ ] Isi form dengan data dummy:
  - Judul: Test Event
  - Deskripsi: Test description
  - Harga: 100000
  - Category: Wedding
- [ ] Klik "Buat Acara"
- [ ] Event akan muncul di list

### 5. Test Event Detail
- [ ] Klik salah satu event
- [ ] Lihat detail page
- [ ] Coba book dengan quantity
- [ ] Klik "Pesan Sekarang"

### 6. Test Bookings
- [ ] Klik "Pemesanan" di navbar
- [ ] Lihat riwayat pemesanan Anda

### 7. Test Profile
- [ ] Klik "Profil" di navbar
- [ ] Edit profile info
- [ ] Klik "Simpan"

## ✅ Verify Everything Works

✅ If you see all ini, setup berhasil:
- [ ] Frontend loading di http://localhost:5173
- [ ] Backend running di http://localhost:5000
- [ ] Can signup/login
- [ ] Can create event
- [ ] Can book event
- [ ] Can see profile
- [ ] Can logout

## 🎉 Success! You're All Set!

Sekarang aplikasi Anda fully functional. Anda bisa:

**Next Steps:**
1. ✅ Explore semua fitur
2. ✅ Baca dokumentasi di `README.md`
3. ✅ Customize warna & branding
4. ✅ Add more features
5. ✅ Deploy ke production

## 📚 Documentation

- **QUICKSTART.md** - Quick setup (ini lebih detail)
- **README.md** - Full documentation
- **BUILD_SUMMARY.md** - Apa yang sudah dibangun
- **SUPABASE_SETUP.md** - Detailed Supabase guide
- **FILES_STRUCTURE.md** - File organization

## 🐛 Troubleshooting Quick Fixes

### Error: "Cannot find module"
```bash
rm -rf node_modules package-lock.json
npm install
```

### Error: "Unauthorized" atau data tidak load
- Check `.env` credentials
- Pastikan schema.sql sudah dijalankan

### Error: "Port 5000 already in use"
```bash
npm run dev -- --port 5001
```

### Error: Frontend tidak connect ke backend
- Pastikan backend running (terminal 1)
- Check browser console untuk error

## 💡 Tips

✨ Pro Tips:
- Save file development → auto refresh
- Console errors helpful untuk debugging
- Check browser DevTools (F12) untuk network errors
- Supabase Dashboard untuk check data
- .env changes butuh terminal restart

## 🎯 Common Tasks

### Edit halaman (misal HomePage)
1. Edit `src/app/pages/HomePage.jsx`
2. Auto refresh di browser

### Add new API endpoint
1. Edit `backend/routes/*.js`
2. Restart backend (Terminal 1)

### Change database
1. Edit di Supabase SQL Editor
2. Atau update `db/schema.sql` dan rerun

### Change styling
1. Edit Tailwind classes di component
2. Auto refresh di browser

### Deploy to production
1. Baca README.md section "Deployment"
2. Follow platform-specific instructions

## 📞 Need Help?

Jika error:
1. Check documentation files (*.md)
2. Review code comments
3. Check browser console (F12)
4. Check Supabase Dashboard untuk data
5. Check server terminal untuk logs

## ✨ Final Checklist

Sebelum deploy:
- [ ] All features tested locally
- [ ] No console errors
- [ ] Database seeded dengan data
- [ ] Environment variables set
- [ ] .env tidak di-commit (check .gitignore)
- [ ] Code commented dan documented
- [ ] Ready for production

---

## 🎊 Congratulations!

Anda sekarang punya **production-ready** full-stack JavaScript application!

**Dari sini, langit adalah batasnya! Happy coding! 🚀**

---

**Need more help?** Baca dokumentasi lengkap di README.md
