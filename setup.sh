#!/bin/bash

# Vendo.id - Setup Script

echo "🎉 Selamat datang di Vendo.id Setup!"
echo "-----------------------------------"
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js tidak ditemukan. Silakan install dari nodejs.org"
    exit 1
fi

echo "✅ Node.js ditemukan: $(node -v)"

# Check npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm tidak ditemukan"
    exit 1
fi

echo "✅ npm ditemukan: $(npm -v)"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Install gagal"
    exit 1
fi

echo "✅ Dependencies installed"
echo ""

# Create .env if not exists
if [ ! -f .env ]; then
    echo "📝 Creating .env file..."
    cp .env.example .env
    echo "⚠️  Silakan edit .env dengan credentials Supabase Anda"
fi

echo ""
echo "✅ Setup selesai!"
echo ""
echo "Langkah selanjutnya:"
echo "1. Edit .env dengan credentials Supabase"
echo "2. Jalankan database schema: db/schema.sql di Supabase SQL Editor"
echo "3. Run backend: npm run dev"
echo "4. Run frontend: npm run dev:frontend"
echo ""
echo "Buka http://localhost:5173 di browser Anda"
