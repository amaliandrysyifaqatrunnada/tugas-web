# Vendo.id - Platform Acara Terpercaya

Aplikasi full-stack JavaScript untuk menemukan, membuat, dan mengelola acara. Dibangun dengan React, Express.js, dan Supabase.

## 🚀 Fitur Utama

### Frontend (React + Vite)
- ✅ Halaman beranda dengan hero section dan info produk
- ✅ Dashboard pencarian acara dengan filter dan sorting
- ✅ Detail acara lengkap dengan informasi organizer
- ✅ Sistem pemesanan/booking acara
- ✅ Halaman profil pengguna dengan manajemen data
- ✅ Riwayat pemesanan dan status tracking
- ✅ Manajemen acara untuk creator
- ✅ Dashboard admin dengan analytics
- ✅ Responsive design untuk mobile & desktop

### Backend (Express.js)
- ✅ REST API lengkap untuk event management
- ✅ Authentication & authorization
- ✅ CRUD operations untuk events, users, dan bookings
- ✅ Role-based access control
- ✅ Error handling dan validation
- ✅ CORS enabled untuk cross-origin requests

### Database (Supabase PostgreSQL)
- ✅ Tabel: users, events, bookings, reviews
- ✅ Row Level Security (RLS) policies
- ✅ Indexes untuk optimasi performa
- ✅ Relationships dan foreign keys

## 📋 Prerequisites

- Node.js v16+ dan npm/pnpm
- Akun Supabase (gratis di supabase.com)
- Git

## 🛠️ Setup & Installation

### 1. Clone Repository
```bash
git clone <repository-url>
cd vendo.id
```

### 2. Install Dependencies
```bash
npm install
# atau jika menggunakan pnpm
pnpm install
```

### 3. Setup Supabase

#### 3.1 Buat Project di Supabase
1. Pergi ke [supabase.com](https://supabase.com)
2. Buat project baru
3. Tunggu project selesai di-initialize
4. Buka SQL Editor dan jalankan script di `db/schema.sql`

#### 3.2 Dapatkan Credentials
- Buka Settings > API
- Copy `Project URL` → `VITE_SUPABASE_URL`
- Copy `anon public` key → `VITE_SUPABASE_ANON_KEY`
- Copy `service_role` key → `SUPABASE_SERVICE_ROLE_KEY`

### 4. Setup Environment Variables

#### Rename `.env.example` ke `.env`:
```bash
cp .env.example .env
```

#### Edit `.env` dan sesuaikan nilai:
```
PORT=5000
NODE_ENV=development

# Supabase
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

# JWT
JWT_SECRET=your-secret-key-here-generate-random
JWT_EXPIRE=7d

# App
APP_URL=http://localhost:5000
```

### 5. Run Development Server

#### Terminal 1 - Backend (Express):
```bash
npm run dev
# Server akan berjalan di http://localhost:5000
```

#### Terminal 2 - Frontend (Vite):
```bash
npm run dev:frontend
# Frontend akan berjalan di http://localhost:5173
```

## 📁 Project Structure

```
vendo.id/
├── server.js                 # Express backend entry point
├── backend/
│   ├── config/
│   │   └── supabase.js      # Supabase configuration
│   ├── middleware/
│   │   └── auth.js          # Authentication middleware
│   ├── routes/
│   │   ├── auth.js          # Auth routes
│   │   ├── events.js        # Events routes
│   │   └── users.js         # Users routes
│   └── controllers/         # Business logic (optional)
├── src/
│   ├── main.jsx            # Entry point
│   ├── app/
│   │   ├── App.jsx         # Root component
│   │   ├── pages/
│   │   │   ├── HomePage.jsx
│   │   │   ├── DashboardPage.jsx
│   │   │   ├── EventDetailPage.jsx
│   │   │   ├── CreateEventPage.jsx
│   │   │   ├── LoginPage.jsx
│   │   │   ├── SignupPage.jsx
│   │   │   ├── ProfilePage.jsx
│   │   │   ├── MyBookingsPage.jsx
│   │   │   └── AdminPage.jsx
│   │   ├── components/
│   │   │   ├── Layout.jsx
│   │   │   ├── ProtectedRoute.jsx
│   │   │   └── ui/          # Shadcn UI components
│   │   ├── context/
│   │   │   └── AuthContext.jsx
│   │   └── services/
│   │       └── api.js       # Axios API client
│   └── styles/
│       └── index.css
├── db/
│   └── schema.sql           # Database schema
├── package.json
├── vite.config.js
├── index.html
└── .env.example
```

## 🔌 API Endpoints

### Authentication
- `POST /api/auth/signup` - Register user
- `POST /api/auth/login` - Login user
- `POST /api/auth/logout` - Logout
- `GET /api/auth/me` - Get current user
- `POST /api/auth/refresh` - Refresh token

### Events
- `GET /api/events` - Get all events (with filters)
- `GET /api/events/:id` - Get event detail
- `POST /api/events` - Create event (authenticated)
- `PUT /api/events/:id` - Update event (owner)
- `DELETE /api/events/:id` - Delete event (owner)
- `POST /api/events/:id/book` - Book event

### Users
- `GET /api/users/:id` - Get user profile
- `PUT /api/users/profile/:id` - Update profile
- `GET /api/users/:id/events` - Get user's events
- `GET /api/users/:id/bookings` - Get user's bookings

## 🔐 Authentication Flow

1. User mendaftar via SignupPage → API `/auth/signup`
2. Token JWT disimpan di localStorage
3. Token dikirim di header `Authorization: Bearer {token}`
4. Protected routes menggunakan `ProtectedRoute` component
5. Logout menghapus token dan user data

## 🎨 Styling

- **Tailwind CSS** untuk utility classes
- **Shadcn/ui** untuk reusable components
- **Lucide React** untuk icons
- **Responsive design** dengan mobile-first approach

## 📊 Database Schema

### Users
- id (UUID)
- email (VARCHAR)
- full_name (VARCHAR)
- phone (VARCHAR)
- bio (TEXT)
- avatar_url (TEXT)

### Events
- id (UUID)
- title (VARCHAR)
- description (TEXT)
- category (VARCHAR)
- price (DECIMAL)
- location (VARCHAR)
- image_url (TEXT)
- tags (TEXT[])
- creator_id (FK → users)
- status (VARCHAR)

### Bookings
- id (UUID)
- event_id (FK → events)
- user_id (FK → users)
- quantity (INT)
- notes (TEXT)
- status (VARCHAR)

### Reviews
- id (UUID)
- event_id (FK → events)
- user_id (FK → users)
- rating (INT 1-5)
- comment (TEXT)

## 🚀 Deployment

### Frontend (Vercel/Netlify)
```bash
npm run build
# Upload dist folder
```

### Backend (Heroku/Railway/Render)
```bash
npm start
```

### Environment Variables di Production
- Set semua `.env` variables di platform deployment
- Update `VITE_API_URL` ke production backend URL

## 🐛 Troubleshooting

### "Cannot find module" errors
```bash
rm -rf node_modules package-lock.json
npm install
```

### Supabase connection failed
- Verifikasi URL dan key di `.env`
- Pastikan RLS policies tidak memblokir akses
- Check Supabase logs untuk error details

### CORS errors
- Backend sudah setup CORS di server.js
- Pastikan frontend URL benar di production

### Token expired
- Gunakan refresh token endpoint
- Session akan auto-logout jika token invalid

## 📝 Catatan Developer

### Best Practices
- ✅ Selalu validate input di backend
- ✅ Gunakan try-catch untuk error handling
- ✅ Set RLS policies untuk keamanan data
- ✅ Cache data dengan react-query (optional)
- ✅ Use environment variables untuk sensitive data

### Pengembangan Lanjutan
- [ ] Integrasi payment gateway (Midtrans/Stripe)
- [ ] Email notifications dengan nodemailer
- [ ] Chat/messaging system
- [ ] Rating dan review system
- [ ] Admin dashboard improvements
- [ ] Analytics dan reporting
- [ ] Mobile app dengan React Native

## 📄 License

MIT License - Silakan digunakan untuk project komersial maupun non-komersial

## 👥 Support

Untuk bantuan atau pertanyaan:
- Email: support@vendo.id
- WhatsApp: +62-XXX-XXXX-XXXX
- Discord: [Join Server](https://discord.gg/vendo)

---

**Made with ❤️ by Vendo.id Team**
