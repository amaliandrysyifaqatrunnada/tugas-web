# Panduan Setup Supabase untuk Vendo.id

## Step-by-Step Setup Supabase

### 1. Buat Account Supabase

1. Buka [supabase.com](https://supabase.com)
2. Klik "Sign Up" (atau "Start Your Project")
3. Login dengan GitHub atau Google
4. Pilih organization name
5. Create organization

### 2. Buat Project Baru

1. Klik "New Project"
2. Isi form:
   - **Database Password**: Ingat password ini! (minimal 8 karakter)
   - **Region**: Pilih yang terdekat (misal: Singapore untuk Asia)
   - **Pricing Plan**: Free tier sudah cukup
3. Klik "Create New Project"
4. Tunggu ~30 detik sampai project selesai

### 3. Setup Database Schema

1. Di Supabase Dashboard, buka **SQL Editor**
2. Klik **"New Query"**
3. Copy-paste seluruh isi dari file `db/schema.sql`
4. Klik **"Run"** atau tekan Ctrl+Enter
5. Tunggu sampai selesai (akan ada notifikasi success)

### 4. Ambil Credentials

1. Buka **Settings** → **API**
2. Cari dan copy:

**VITE_SUPABASE_URL:**
```
Buka tab "Project API"
Copy dari field "Project URL"
Contoh: https://xyzabc.supabase.co
```

**VITE_SUPABASE_ANON_KEY:**
```
Di tab yang sama
Copy dari "anon public" - Project API keys
Contoh: eyJhbGc...
```

**SUPABASE_SERVICE_ROLE_KEY:**
```
Di tab yang sama
Scroll ke bawah
Copy dari "service_role" - Project API keys
Contoh: eyJhbGc...
```

### 5. Update .env File

Edit file `.env` di root project:

```env
VITE_SUPABASE_URL=https://xyzabc.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGc...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGc...
```

**⚠️ PENTING:**
- Jangan ada space sebelum/sesudah `=`
- Jangan gunakan tanda kutip
- Restart terminal setelah save

### 6. Enable Authentication

1. Buka **Authentication** di sidebar
2. Klik **"Providers"**
3. Pastikan **Email** sudah diaktifkan
4. Setup optional: Google, GitHub, etc.

### 7. Test Connection

1. Jalankan backend:
```bash
npm run dev
```

2. Jalankan frontend:
```bash
npm run dev:frontend
```

3. Di browser: http://localhost:5173
4. Klik "Daftar"
5. Isi form dengan data dummy
6. Submit

Jika berhasil, Anda akan bisa login dan melihat data di Supabase.

## Troubleshooting Supabase

### Error: "Unauthorized" atau "403"

**Penyebab:** RLS policies
**Solusi:**
1. Buka Supabase → SQL Editor
2. Check di bagian RLS - pastikan policies sudah jalan
3. Alternatif: Temporarily disable RLS untuk testing
   ```sql
   ALTER TABLE events DISABLE ROW LEVEL SECURITY;
   ALTER TABLE users DISABLE ROW LEVEL SECURITY;
   ALTER TABLE bookings DISABLE ROW LEVEL SECURITY;
   ```

### Error: "Connection timeout"

**Penyebab:** URL/key salah atau project sedang restart
**Solusi:**
1. Verify ulang credentials di `.env`
2. Cek apakah project masih aktif di Supabase Dashboard
3. Tunggu beberapa menit jika project baru saja dibuat

### Error: "Invalid JWT"

**Penyebab:** Token expired atau key salah
**Solusi:**
1. Clear localStorage di browser
2. Login ulang
3. Pastikan JWT_SECRET di `.env` unique

### Data tidak terlihat di Supabase

**Penyebab:** RLS policies terlalu ketat
**Solusi:**
1. Buka SQL Editor
2. Run query:
   ```sql
   ALTER TABLE users DISABLE ROW LEVEL SECURITY;
   ALTER TABLE events DISABLE ROW LEVEL SECURITY;
   ```
3. Test ulang

## Verifikasi Setup

Setelah setup, pastikan:

✅ **Database Tables**
- Di Supabase → Table Editor
- Harus ada 4 table: users, events, bookings, reviews

✅ **API Keys**
- Settings → API
- Credentials tersimpal dengan baik

✅ **RLS Policies**
- Buka SQL Editor
- Jalankan: `SELECT * FROM auth.users;`
- Tidak ada error

✅ **Authentication**
- Homepage bisa akses
- Signup form berfungsi
- Login berfungsi

## Settings Lanjutan (Optional)

### Enable Real-time

1. Buka **Realtime** di sidebar
2. Klik toggle untuk table yang ingin real-time
3. Ini useful untuk live updates

### Setup Email Templates

1. Buka **Authentication** → **Email Templates**
2. Customize welcome email, etc.

### Add Custom Domain

1. Buka **Settings** → **Custom Domains**
2. Setup domain kustom untuk API

## Backup & Export

### Backup Database

1. Buka **Settings** → **Backups**
2. Klik **"Request backup"**
3. Backup akan dikirim ke email

### Export Data

1. Buka **SQL Editor**
2. Run:
   ```sql
   SELECT * FROM events;
   ```
3. Klik download icon

## Security Best Practices

✅ Do:
- Rotate JWT_SECRET secara berkala
- Gunakan strong database password
- Keep credentials di .env (jangan commit)
- Enable MFA di Supabase account
- Backup data secara berkala

❌ Don't:
- Expose API keys di public
- Commit .env file
- Disable RLS di production
- Share database password
- Use simple JWT_SECRET

## Production Deployment

Saat deploy ke production:

1. **Create production project** di Supabase (atau use branch)
2. **Update credentials** di production `.env`
3. **Enable RLS policies** yang lebih ketat
4. **Setup SSL** (Supabase default HTTPS)
5. **Monitor usage** di Supabase Dashboard
6. **Setup alerts** untuk quota limits

## Pricing Info

**Free Tier (Gratis):**
- 500MB database
- 1GB bandwidth
- 50MB file storage
- Cukup untuk development & testing

**Pro/Team:**
- Unlimited database
- Pay per usage
- Priority support
- Advanced features

---

**Butuh bantuan lebih?** Lihat [Supabase Docs](https://supabase.com/docs)
