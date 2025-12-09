var websocket = null;

function init() {
    // Mở kết nối đến Chat Server
    // LƯU Ý: Thay 'websocket' bằng tên Project của em nếu cần thiết
    websocket = new WebSocket('ws://localhost:8080/java4-lab8/text/chat');

    // 1. Xử lý sự kiện kết nối thành công
    websocket.onopen = function(resp) {
        console.log("Connected to server!");
    };

    // 2. Xử lý sự kiện nhận tin nhắn từ Server
    websocket.onmessage = function(resp) {
        var message = resp.data; // Lấy nội dung tin nhắn
        var chatBox = document.getElementById("messages");
        
        // Thêm tin nhắn mới vào vùng hiển thị (giữ lại tin nhắn cũ)
        chatBox.innerHTML += "<p>" + message + "</p>";
        
        // Tự động cuộn xuống dòng mới nhất
        chatBox.scrollTop = chatBox.scrollHeight;
        
        console.log("Received:", message);
    };

    // 3. Xử lý sự kiện lỗi
    websocket.onerror = function(resp) {
        alert("An error occurred, closing application!");
        console.log("Error:", resp);
    };

    // 4. Xử lý sự kiện đóng kết nối
    websocket.onclose = function(resp) {
        // alert(resp.reason || 'Goodbye'); // Có thể bật lên nếu muốn thông báo
        console.log("Connection closed");
    };
}

// Hàm gửi tin nhắn khi nhấn nút Send
function send() {
    var messageInput = document.getElementById("message");
    var content = messageInput.value;

    if (content.trim() !== "") {
        // Gửi tin nhắn lên server
        websocket.send(content);
        
        // Xóa ô nhập liệu sau khi gửi
        messageInput.value = "";
    }
}