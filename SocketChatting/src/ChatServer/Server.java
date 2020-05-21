package ChatServer;

import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Iterator;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public class Server  {

	public static ExecutorService threadPool;
	public static Vector<Client> clients = new Vector<Client>();

	ServerSocket serversocket;

	// 서버 구동후 클라이언트 연결 대기
	public void startServer(String ip, int port) {
		try {
			serversocket = new ServerSocket();
			serversocket.bind(new InetSocketAddress(ip, port));
		} catch (Exception e) {
			e.printStackTrace();
			if (!serversocket.isClosed())
				stopServer();
			return;
		}
		
		Runnable thread = new Runnable() {
			
			@Override
			public void run() {
				while(true) {
					try {
						Socket socket = serversocket.accept();
						clients.add(new Client(socket));
					} catch (Exception e) {
						if(!serversocket.isClosed())
							stopServer();
						break;
					}
				}
				
			}
		};
		threadPool = Executors.newCachedThreadPool();
		threadPool.submit(thread);
	}

	// 서버 종료
	public void stopServer() {
		try {
			Iterator<Client> iterator = clients.iterator();
			while(iterator.hasNext()) {
				Client client = iterator.next();
				client.socket.close();
				iterator.remove();
			}
			//서버 소켓 닫기
			if(serversocket != null && !serversocket.isClosed())
				serversocket.close();
			
			//쓰레드 풀 종료하기
			if(threadPool != null && !threadPool.isShutdown())
				threadPool.shutdown();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
