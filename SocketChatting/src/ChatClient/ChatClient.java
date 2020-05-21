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
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyCode;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class ChatClient extends Application {

	Socket socket;
	TextArea textArea;
	String userName;
	String Position;
	String ip;
	int port;
	Boolean checker = false;

	// 클라이언트 프로그램 작동
	public void startClient(String ip, int port) {
		Thread thread = new Thread() {
			public void run() {
				try {
					socket = new Socket(ip, port);
					checker= true;
					receive();
				} catch (Exception e) {
					textArea.appendText("Check the IP and Port you enterd \n");
					return;
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
	
	public void setUser(String Position, String name, String ip, int port) {
		this.userName = name;
		this.Position = Position;
		this.ip = ip;
		this.port = port;
	}

	@Override
	public void start(Stage primaryStage) throws Exception {

		Parent root = null;
		FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/View/chatting.fxml"));
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
		Button btnSwitch = (Button) root.lookup("#btnSwitch");
		textArea = (TextArea) root.lookup("#txtChat");
		TextField input = (TextField) root.lookup("#txtSend");
		
		textArea.setDisable(true);
		input.setDisable(true);
		btnSend.setDisable(true);
		
		input.setOnKeyPressed(event ->{
			if (event.getCode().equals(KeyCode.ENTER)) {
				send("["+Position+"]" +userName+ ": "+input.getText()+"\n");
				input.setText("");
				input.requestFocus();
			}
		});
		
		btnSend.setOnAction(event -> {
			send("["+Position+"]: "+input.getText()+"\n");
			input.setText("");
			input.requestFocus();
		});
		
		btnSwitch.setOnAction(event ->{
			if(btnSwitch.getText().equals("Connection")) {
				startClient(ip, port);
				if(checker) {
					Platform.runLater(()->{
						textArea.appendText("[ "+userName+" connection Chat ] \n");
					});
					btnSwitch.setText("Termination");
					textArea.setDisable(false);
					input.setDisable(false);
					btnSend.setDisable(false);
					input.requestFocus();
				}
				
			}else {
				stopClient();
				Platform.runLater(()->{
					textArea.appendText("[ "+userName+" termination Chat ] \n");
				});
				btnSwitch.setText("Connection");
				textArea.setDisable(true);
				input.setDisable(true);
				btnSend.setDisable(true);
			}
		});
		
		
		
	}

}
