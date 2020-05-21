import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Label;
import java.awt.Panel;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;

public class MyFrame extends Frame{

	private int start, end;
	private ArrayList<Integer> list;
	private Dijkstra di;
	private int[][] xRoad, yRoad;
	private FindingWay fw;
	private TextField tf1, tf2;
	private MyFrame f;
	private int key;
	
	
	public class WindowHandler extends WindowAdapter{
		public void windowClosing(WindowEvent e) {
			System.exit(1);
		}
	}
	
	public class ActionHandler implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			key = 1;
			list.clear();
			try {
				if(tf1.getText().toString()!="") {
					start = Integer.parseInt(tf1.getText().toString());
				}
				if(tf2.getText().toString()!="") {
					end = Integer.parseInt(tf2.getText().toString());
				}
			}catch(NumberFormatException e1) {
				key = 2;
				start = 1;
				end = 1;
				
			}
		
			di.dijkstra(start, end);
			di.route(list);			
			f.repaint();
		}
	}
	
	
	public MyFrame() {
		f = this;
		key = 0;
		xRoad = new int[8][8];
		yRoad = new int[8][8];
		WindowHandler wh = new WindowHandler();
		ActionHandler ah= new ActionHandler();
		list = new ArrayList<Integer>();
		fw = new FindingWay();
		di = new Dijkstra(this);
		this.addWindowListener(wh);
		tf1 = new TextField(1);
		tf2 = new TextField(1);
		Label l1 =new Label("Start Node");
		Label l2 =new Label("End Node");
		Panel p = new Panel();
		Button b1 = new Button("Shortest Path");
		b1.addActionListener(ah);
		this.setLayout(new BorderLayout());
		this.add(p,BorderLayout.SOUTH);
		p.setLayout(new FlowLayout());
		p.add(l1);
		p.add(tf1);
		p.add(l2);
		p.add(tf2);
		p.add(b1);
		
		
		

	}
	
	public void paint(Graphics g) {
		g.setColor(Color.RED);
		g.drawString("Shortest path: ", 50, 50);
		g.setColor(Color.BLACK);
		g.drawOval(150, 100, 40, 40); //1
		g.drawOval(220, 250, 40, 40);//4
		g.drawOval(300, 350, 40, 40);//7
		g.drawOval(450, 350, 40, 40);//8
		g.drawOval(500, 230, 40, 40);//6
		g.drawOval(450, 80, 40, 40);//3
		g.drawOval(300, 130, 40, 40);//2
		g.drawOval(350, 220, 40, 40);//5
		//route
		g.drawString("4", 170, 200);
		g.drawString("4", 250, 340);
		g.drawString("5", 380, 390);
		g.drawString("3", 490, 320);
		g.drawString("1", 500, 180);
		g.drawString("4", 390, 120);
		g.drawString("2", 250, 130);
		g.drawString("3", 260, 220);
		g.drawString("3", 280, 255);
		g.drawString("5", 355, 200);
		g.drawString("2", 440, 230);
		g.drawString("2", 430, 310);
		g.drawString("1", 320, 300);
		//number
		g.drawString("1", 165, 125);
		g.drawString("4", 235, 275);
		g.drawString("7",315, 375);
		g.drawString("8",465, 375);
		g.drawString("6",515, 255);
		g.drawString("3",465, 105);
		g.drawString("2",315, 155);
		g.drawString("5",365, 245);
		g.drawLine(170, 140, 220, 270);//1-4
		g.drawLine(190, 120, 300, 150);//1-2
		g.drawLine(340, 150, 450, 100);//2-3
		g.drawLine(320, 170, 245, 250);//2-4
		g.drawLine(330, 165, 360, 225);//2-5
		g.drawLine(480, 115, 505, 240);//3-6
		g.drawLine(240, 290, 300, 370);//4-7
		g.drawLine(260, 270, 355, 250);//4-5
		g.drawLine(385, 230, 505, 240);//5-6
		g.drawLine(385, 250, 455, 360);//5-8
		g.drawLine(505, 260, 470, 350);//6-8
		g.drawLine(340, 370, 450, 370);//7-8
		g.drawLine(320, 350, 360, 255);//7-5
		g.drawLine(340, 370, 450, 370);//7-8
		g.drawLine(320, 350, 360, 255);
		if(key == 1 && list.size() != 0) {
			g.setColor(Color.RED);
			g.drawString(Integer.toString(di.distance(end-1)), 140, 50);
			g.drawLine(fw.getXstart(list.get(0),end-1), fw.getYstart(list.get(0), end- 1), fw.getXarrival(list.get(0), end-1), fw.getYarrival(list.get(0), end-1));
			for(int k = 0; k<list.size()-1;k=k+1) {
				g.drawLine(fw.getXstart(list.get(k+1),list.get(k)), fw.getYstart(list.get(k+1), list.get(k)), fw.getXarrival(list.get(k+1), list.get(k)), fw.getYarrival(list.get(k+1), list.get(k)));
			}
			g.drawLine(fw.getXstart(start-1,list.get(list.size()-1)), fw.getYstart(start-1, list.get(list.size()-1)), fw.getXarrival(start-1, list.get(list.size()-1)), fw.getYarrival(start-1, list.get(list.size()-1)));
		}
		
		if(key == 1 && list.size() == 0) {
			g.setColor(Color.RED);
			g.drawString(Integer.toString(di.distance(end-1)), 140, 50);
			g.drawLine(fw.getXstart(start-1,end-1), fw.getYstart(start-1, end-1), fw.getXarrival(start-1, end-1), fw.getYarrival(start-1, end-1));
		}
		
		if(key == 2) {
			g.setColor(Color.red);
			g.drawString("Please, give number and try again",140, 50);
		}
		
	}
}
