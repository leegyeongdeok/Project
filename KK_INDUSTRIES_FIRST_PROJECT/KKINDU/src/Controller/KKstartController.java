package Controller;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;

import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.MediaView;

public class KKstartController implements Initializable {

	@FXML
	private MediaView startView;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		Media media = new Media(getClass().getResource("/View/images/start.m4v").toString());

		MediaPlayer mediaPlayer = new MediaPlayer(media);
		startView.setMediaPlayer(mediaPlayer);
		
		Thread thread = new Thread() {
			@Override
			public void run() {
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
				  }
		
				mediaPlayer.play();
			}
		};
		thread.start();
	};
}
