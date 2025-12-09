var username = null;
var websocket = null;

function init() {
    while (username === null || username === "") {
        username = prompt("Enter username");
    }

    // Kết nối đến Server Endpoint đã viết ở Bước 4
    websocket = new WebSocket(`ws://localhost:8080/java4-lab8/json/chat/${username}`);

    websocket.onopen = function(resp) {
        console.log("Connected to WebSocket server.");
    };

    websocket.onmessage = function(resp) {
        // Dữ liệu nhận về là JSON String, cần parse ra Object
        var msg = JSON.parse(resp.data);
        var output = document.getElementById("messages");

        // Logic hiển thị tin nhắn
        // Nếu msg.type != 2 (tức là tin Join/Left), cập nhật số người online
        if (msg.type !== 2) {
             document.getElementById("client-count").innerHTML = msg.count;
             // Hiển thị thông báo hệ thống (in nghiêng chẳng hạn)
             output.innerHTML += `<p><i>${msg.sender} ${msg.text}</i></p>`;
        } else {
             // Tin nhắn chat thông thường (in đậm tên người gửi)
             output.innerHTML += `<p><b>${msg.sender}</b>: ${msg.text}</p>`;
        }
        
        // Tự động cuộn xuống dưới cùng
        output.scrollTop = output.scrollHeight;
    };

    websocket.onerror = function(resp) {
        console.log("Error:", resp);
        alert("An error occurred, closing application");
    };
    
    websocket.onclose = function(resp) {
        console.log("Connection closed.");
    };
}

function send() {
    var input = document.getElementById("message");
    // Tạo object JS đúng cấu trúc Server yêu cầu
    var msg = {
        sender: username,
        text: input.value,
        type: 2 // Loại 2 là tin nhắn chat
    };
    // Chuyển Object thành String JSON để gửi đi
    websocket.send(JSON.stringify(msg));
    input.value = ""; // Xóa ô nhập liệu
}