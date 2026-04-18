import pytest
# Nhập ứng dụng Flask từ file app.py của bạn
from app import app 

@pytest.fixture
def client():
    # Cấu hình app ở chế độ testing
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

# Hàm test này sẽ kiểm tra API /healthcheck
def test_healthcheck(client):
    # Gửi một request GET ảo đến đường dẫn /healthcheck
    response = client.get('/healthcheck')
    
    # Kiểm tra xem mã trạng thái trả về có đúng là 200 OK không
    assert response.status_code == 200
    
    # Kiểm tra xem nội dung JSON trả về có chứa message "OK" không
    data = response.get_json()
    assert data["message"] == "OK"
    assert "uptime" in data