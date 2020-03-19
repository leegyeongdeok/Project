package ChatClient;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.input.KeyCode;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class ChatClient extends Application {

	Socket socket;
	TextArea textArea;
	String userName;
	String Depart;
	String Position;

	// 클라이언트 프로그램 작동
	public void startClient(String ip, int port) {
		Thread thread = new Thread() {
			public void run() {
				try {
					socket = new Socket(ip, port);
					receive();
				} catch (Exception e) {
					if (!socket.isClosed()) {
						stopClient();
						Alert alert = new Alert(AlertType.WARNING);
						alert.setHeaderText("Client");
						alert.setContentText("Server connection failed ");
						alert.show();
					}
				}
			}
		};
		thread.start();
	}

	// 클라이언트 종료
	public void stopClient() {
		try {
			if(socket != null && ! socket.isClosed()) {
				socket.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 서버에서 메세지 수신
	public void receive() {
		while (true) {

			try {
				InputStream in = socket.getInputStream();
				byte[] buffer = new byte[512];
				int length = in.read(buffer);
				if(length == -1) throw new IOException();
				String message = new String(buffer, 0, length, "UTF-8");
				Platform.runLater(()->{
					textArea.appendText(message);
				});
			} catch (IOException e) {
				stopClient();
				break;
			}

		}
	}

	// 서버로 메세지 발신
	public void send(String message) {
		Thread thread = new Thread() {
			public void run() {
				try {
					OutputStream out = socket.getOutputStream();
					byte[] buffer = message.getBytes("UTF-8");
					out.write(buffer);
					out.flush();
				} catch (Exception e) {
					stopClient();
				}
			}
		};
		thread.start();
	}
	
	public void setUser(String name, String Depart, String Position) {
		this.userName = name;
		this.Depart = Depart;
		this.Position = Position;
	}

	@Override
	public void start(Stage primaryStage) throws Exception {

		Parent root = null;
		FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/View/listokk.fxml"));
		try {
			root = fxmlLoader.load();
		} catch (Exception e1) {
		}
		Scene scene = new Scene(root);
		primaryStage.setScene(scene);
		primaryStage.setX(1200);
		primaryStage.setY(200);
		primaryStage.show();
		
		
		Button btnSend = (Button) root.lookup("#btnSend");
		Button btnSwich = (Button) root.lookup("#btnSwich");
		textArea = (TextArea) root.lookup("#txtChat");
		TextField input = (TextField) root.lookup("#txtSend");
		
		input.setDisable(true);
		btnSend.setDisable(true);
		
		input.setOnKeyPressed(event ->{
			if (event.getCode().equals(KeyCode.ENTER)) {
				send("["+Depart+" "+Position+"]" +userName+ ": "+input.getText()+"\n");
				input.setText("");
				input.requestFocus();
			}
		});
		
		btnSend.setOnAction(event -> {
			send("["+Depart+" "+Position+"] :"+input.getText()+"\n");
			input.setText("");
			input.requestFocus();
		});
		
		btnSwich.setOnAction(event ->{
			if(btnSwich.getText().equals("Connection")) {
				startClient("192.168.1.3", 7777);
				Platform.runLater(()->{
					textArea.appendText("[ "+userName+" connection Chat ] \n");
				});
				btnSwich.setText("Termination");
				input.setDisable(false);
				btnSend.setDisable(false);
				input.requestFocus();
			}else {
				stopClient();
				Platform.runLater(()->{
					textArea.appendText("[ "+userName+" termination Chat ] \n");
				});
				btnSwich.setText("Connection");
				input.setDisable(false);
				btnSend.setDisable(false);
			}
		});
		
		
		
	}

}
