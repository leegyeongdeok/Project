import java.util.ArrayList;

public class Dijkstra {
	private int INF, start, end;
	private boolean[] visit;
	private int distance[];
	private int[][] map;
	private ArrayList<Integer> indexList;
	private ArrayList<Integer> kList;
	private ArrayList<Integer> index;
	private MyFrame f;
	
	
	public Dijkstra(MyFrame frame) {
		f = frame;
		INF = 1000000;
		indexList = new ArrayList<Integer>();
		index = new ArrayList<Integer>();
		kList = new ArrayList<Integer>(); 
		map = new int[][]{{0,2,INF,4,INF,INF,INF,INF},
				 {2,0,4,3,5,INF,INF,INF},
				 {INF,4,0,INF,INF,1,INF,INF},
				 {4,3,INF,0,3,INF,4,INF},
				 {INF,5,INF,3,0,2,1,2},
				 {INF,INF,1,INF,2,0,INF,3},
				 {INF,INF,INF,4,1,INF,0,5},
				 {INF,INF,INF,INF,2,3,5,0}};
		
	}
	
	public int dijkstra(int s, int e) {
		int min = INF;
		int index = 0;
		indexList.clear();
		kList.clear();
		visit = new boolean[8];
		distance = new int[8];
		start = s - 1;
		end = e - 1;
		distance[start] = 0;
		visit[start] = true;
		for(int k = 0; k<8;k=k+1) {
			distance[k] = map[start][k];
		}
	
		for(int i =0; i<7;i=i+1) {
			min = Integer.MAX_VALUE;
			index = 0;
			for(int j = 0; j<8;j=j+1) {
				if(visit[j]!=true && distance[j]!=0) {
					if(distance[j]<min) {
						min = distance[j];
						index = j;
					}
				}
			}
			visit[index] = true;
			for(int k=0; k<8;k=k+1) {
				if(visit[k]!=true && map[index][k]!=0) {
					if(distance[k]>distance[index]+map[index][k]) {
						distance[k] = distance[index]+map[index][k];
						indexList.add(index);
						kList.add(k);
					}
				}
			}
		}
		
		
		return distance[end];
	}
	
	public void route(ArrayList<Integer> list) {
		int kcount = 0;
		int no = 0;
		index.clear();
		for(int k=0;k<kList.size();k=k+1) {
			if(kList.get(k) == end) {
				kcount = k;
				index.add(indexList.get(kcount));
			}
		}
			
		
		
		for(int i=indexList.size()-1;i>-1;i=i-1) {
			for(int j=0; j<index.size();j=j+1) {
				if(kList.get(i) == index.get(j)) {
					index.add(indexList.get(i));
				}
			}		
		}
		for(int k =0; k<index.size();k=k+1) {
			list.add(index.get(k));
		}
	}
	
	public int distance(int a) {
		return distance[a];
	}

	
			
		


}
