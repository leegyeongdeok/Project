package ChatServer;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;

public class Client {

	Socket socket;

	public Client(Socket socket) {
		this.socket = socket;
		receive();
	}

	// 메세지 수신
	public void receive() {
		Runnable thread = new Runnable() {

			@Override
			public void run() {
				try {
					while (true) {
						InputStream in = socket.getInputStream();
						byte[] buffer = new byte[512];

						int length = in.read(buffer);
						if(length == -1) throw new IOException();
						System.out.println("수신성공" +socket.getRemoteSocketAddress()+" "+Thread.currentThread().getName());
						
						String message = new String(buffer, 0, length, "UTF-8");
						for(Client client : Server.clients) {
							client.send(message);
						}
					}
				} catch (Exception e) {
					try {
						Alert alert = new Alert(AlertType.WARNING);
						alert.setHeaderText("Error");
						alert.setContentText("receive Message Error");
						alert.show();
						Server.clients.remove(Client.this);
						socket.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}

			}
		};
		Server.threadPool.submit(thread);
	}

	// 메세지 발신
	public void send(String message) {
		Runnable thread = new Runnable() {
			
			@Override
			public void run() {
				try {
					OutputStream out = socket.getOutputStream();
					byte[] buffer = message.getBytes("UTF-8");
					out.write(buffer);
					out.flush();
				} catch (Exception e) {
					try {
						Alert alert = new Alert(AlertType.WARNING);
						alert.setHeaderText("Error");
						alert.setContentText("send Message Error");
						alert.show();
						Server.clients.remove(Client.this);
						socket.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}			
			}
		};
		Server.threadPool.submit(thread);
	}

}
