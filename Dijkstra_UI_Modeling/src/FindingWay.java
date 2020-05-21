import java.util.ArrayList;

public class FindingWay {

	private int[][] xStart, yStart, xArrival, yArrival;
	
	
	public FindingWay() {
		xStart = new int[8][8];
		yStart = new int[8][8];
		xArrival = new int[8][8];
		yArrival = new int[8][8];
		
		//Starting Point 1
		xStart[0][3] = xStart[3][0] = 170;
		yStart[0][3] = yStart[3][0] = 140;
		xArrival[0][3] = xArrival[3][0] = 220;
		yArrival[0][3] = yArrival[3][0] = 270;	
		xStart[0][1] = xStart[1][0] = 190;
		yStart[0][1] = yStart[1][0] = 120;
		xArrival[0][1] = xArrival[1][0] = 300;
		yArrival[0][1] = yArrival[1][0] = 150;
		
		//Starting Point 2
		xStart[1][2] = xStart[2][1]=340;
		yStart[1][2] = yStart[2][1]=150;
		xArrival[1][2] = xArrival[2][1]= 450;
		yArrival[1][2] = yArrival[2][1]=100;	
		xStart[1][3] = xStart[3][1]=320;
		yStart[1][3] = yStart[3][1]= 170;
		xArrival[1][3] = xArrival[3][1] = 245;
		yArrival[1][3] = yArrival[3][1] = 250;
		xStart[1][4] = xStart[4][1] = 330;
		yStart[1][4] = yStart[4][1] = 165;
		xArrival[1][4] = xArrival[4][1] = 360;
		yArrival[1][4] = yArrival[4][1] = 225;
		
		//Starting Point 3
		xStart[2][5] = xStart[5][2] = 480;
		yStart[2][5] = yStart[5][2] = 115;
		xArrival[2][5] = xArrival[5][2] = 505;
		yArrival[2][5] = yArrival[5][2] = 240;
		
		//Starting Point 4
		xStart[3][6] = xStart[6][3] = 240;
		yStart[3][6] = yStart[6][3]=290;
		xArrival[3][6] = xArrival[6][3] = 300;
		yArrival[3][6] = yArrival[6][3] = 370;
		xStart[3][4] = xStart[4][3] = 260;
		yStart[3][4] = yStart[4][3] = 270;
		xArrival[3][4] = xArrival[4][3] = 355;
		yArrival[3][4] = yArrival[4][3] = 250;	
		
		//Starting Point 5
		xStart[4][5] = xStart[5][4] = 385;
		yStart[4][5] = yStart[5][4] = 230;
		xArrival[4][5] = xArrival[5][4] = 505;
		yArrival[4][5] = yArrival[5][4] =240;
		xStart[4][7] = xStart[7][4] = 385;
		yStart[4][7] = yStart[7][4] = 250;
		xArrival[4][7] = xArrival[7][4] = 455;
		yArrival[4][7] = yArrival[7][4] = 360;	
		
		//Starting Point 6
		xStart[5][7] = xStart[7][5] = 505;
		yStart[5][7] = yStart[7][5] = 260;
		xArrival[5][7] = xArrival[7][5] = 470;
		yArrival[5][7] = yArrival[7][5] = 350;
		
		//Starting Point 7
		xStart[6][7] =xStart[7][6]=  340;
		yStart[6][7] = yStart[7][6] = 370;
		xArrival[6][7] = xArrival[7][6] = 450;
		yArrival[6][7] = yArrival[7][6] = 370;
		xStart[6][4] = xStart[4][6] = 320;
		yStart[6][4] = yStart[4][6] = 350;
		xArrival[6][4] = xArrival[4][6] = 360;
		yArrival[6][4] = yArrival[4][6] = 255;
		
	}
	
	public int getXstart(int i, int j) {
		return xStart[i][j];
	}
	public int getYstart(int i, int j) {
		return yStart[i][j];
	}
	public int getXarrival(int i, int j) {
		return xArrival[i][j];
	}
	public int getYarrival(int i, int j) {
		return yArrival[i][j];
	}
	
}
