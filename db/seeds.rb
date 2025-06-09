puts "\n== Seeding the database with fixtures ==" # これはコンソールに表示されます
system("bin/rails db:fixtures:load") # これはデータベースにフィクスチャをロードします。