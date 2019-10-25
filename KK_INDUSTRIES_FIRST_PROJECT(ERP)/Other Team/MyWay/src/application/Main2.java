package application;

import Controller.LoginController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main2 extends Application {

    public static void main(String[] args) {
        launch(args);

    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/View/loginView.fxml"));
        Parent root = fxmlLoader.load();
        Scene scene = new Scene(root);

        LoginController loginController = fxmlLoader.getController();
        loginController.setPrimaryStage(primaryStage);

        primaryStage.setScene(scene);
        primaryStage.setTitle("���̿��� ������ġ");
        primaryStage.setResizable(false);
        primaryStage.show();

    }

}