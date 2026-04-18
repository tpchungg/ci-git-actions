#!/bin/bash

# 1. Đọc thông tin từ file .env
if [ -f .env ]; then
    source .env
else
    echo "Lỗi: Không tìm thấy file .env"
    exit 1
fi

# 2. Add toàn bộ file có sự thay đổi
echo "Đang add các file thay đổi..."
git add .

# 3. Yêu cầu người dùng nhập nội dung commit (Dừng lại chờ input)
read -p "Nhập nội dung commit: " commit_msg

# 4. Thực hiện commit
git commit -m "$commit_msg"

# 5. Lấy URL gốc của Repo và nhánh hiện tại
CURRENT_BRANCH=$(git branch --show-current)
REMOTE_URL=$(git config --get remote.origin.url)

# Kiểm tra xem Repo đã được liên kết chưa
if [ -z "$REMOTE_URL" ]; then
    echo "Lỗi: Chưa có remote origin. Hãy chạy 'git remote add origin <url>' trước."
    exit 1
fi

# 6. Chèn Username và Password vào URL để xác thực
# Lệnh này thay thế 'https://' thành 'https://username:password@'
AUTH_URL="${REMOTE_URL/https:\/\//https:\/\/$GIT_USERNAME:$GIT_PASSWORD@}"

# 7. Push code lên GitHub
echo "Đang push code lên nhánh $CURRENT_BRANCH..."
git push "$AUTH_URL" "$CURRENT_BRANCH"

echo "Push code thành công!"