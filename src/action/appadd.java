import java.io.*;
import java.util.*;

public class appadd 
{
	public static int number=0;
	public static float require[][]=new float[4][2];
	public static int apper[][]=new int[4][14];
	public static void main(String[] args) throws IOException
	{
		
		PrintWriter pw = null;
	    File file = new File("D:\\JAVA\\Qos\\RESULT.txt");
	    pw = new PrintWriter(file);
			//record the gram
		long starttime = System.currentTimeMillis();
		
		BufferedReader ar =new BufferedReader(new InputStreamReader(new FileInputStream("D:\\JAVA\\Qos\\PROCESS.txt")));		
		String data = null;
		String[] jieguo=new String[4];
		for(int rzx1=0;rzx1<4;rzx1++)
			{
				for(int wb1=0;wb1<14;wb1++)
				{
					apper[rzx1][wb1]=0;
				}
			}
		while((data = ar.readLine())!=null)
			{
				for(int i=0;i<data.length();i++){
					if((data.charAt(i)>=65)&&(data.charAt(i)<=78)){
						apper[number][data.charAt(i)-65]++;
					}
				}
				jieguo[number]=data;
				number++;
			}
		ar.close();
			
		//record the require
		number=0;
		BufferedReader rr = null;
		rr = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\JAVA\\Qos\\REQ.txt")));
		String temp=null;
			while((temp = rr.readLine())!=null)
			{
				String subtemp=temp.substring(5,7);
				require[number][1]=Float.parseFloat(subtemp);
				require[number][0]=(temp.charAt(3)-48);
				require[number][0]=require[number][0]/10;
				number++;
			}
		rr.close();
			/*for(number=0;number<4;number++)
			{
			System.out.println(require[number][0]);
			System.out.println(require[number][1]);
			}*///appear the result
			
		//record the point and delete the expensive point
		number=0;
		while(number<4)
		{
			BufferedReader br = null;
			br = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\JAVA\\Qos\\SERVICE.txt")));
			List total=new LinkedList();
			String sd = null;
			for(int j=0;j<14;j++)
			{
				List<servicedata> ll=new LinkedList<servicedata>();
				if(apper[number][j]>0)
					{
						for(int r=0;r<500;r++)
						{
							sd = br.readLine();
							Scanner scanner = new Scanner(sd) ;
							while(scanner.hasNext())
							{
								servicedata lei =new servicedata();
								lei.name=scanner.next();
								scanner.next();
								lei.kekao=scanner.nextFloat();
								scanner.next();
								lei.price=scanner.nextFloat();
								//System.out.println(lei.name+" "+lei.kekao+" "+lei.price);//显示读入的每个点
								ll.add(lei);
							}
						}
					Collections.sort(ll);
					choice(ll);
					total.add(ll);
					//for(servicedata s:ll){
			        //    System.out.println(s.name+" "+s.kekao+" "+s.price);
			        //}//appear the result
					}
				else{
					for(int r=0;r<500;r++)
					sd = br.readLine();
					}
			}
			br.close();
			
			
			List ss=new LinkedList();
			servicedata begin =new servicedata();
			begin.name="";
			begin.kekao=1;
			begin.price=0; 
			ss.add(begin);
			Iterator loop1 =total.iterator();
			while(loop1.hasNext())//loop for the A~N
			{
				List biao=(List)loop1.next();
				List s1=new LinkedList();
				Iterator loop2 = ss.iterator();
				while(loop2.hasNext())//loop for the s
				{
					servicedata now=(servicedata)loop2.next();
					Iterator loop3 =biao.iterator();
					while(loop3.hasNext())//loop for the now char
					{
						servicedata jisuan =(servicedata)loop3.next();
						servicedata result =new servicedata();
						result.name =now.name+" "+jisuan.name ;
						result.kekao=now.kekao*jisuan.kekao;
						result.price=now.price+jisuan.price;
						s1.add(result);
					}
				}
				ss=s1;
				Collections.sort(ss);
				choice(ss);
				
			}
			Iterator loop5 =ss.iterator();
			float Qosmax;
			servicedata start =new servicedata();
			start=(servicedata)loop5.next();
			while(loop5.hasNext())
			{
				servicedata show =(servicedata)loop5.next();
				if((show.kekao-show.price/100)<(start.kekao-start.price/100))
				{loop5.remove();}
				else
				{
				start.name=show.name;
				start.kekao=show.kekao;
				start.price=show.price;
				}
			}//appear the result
			float q=start.kekao-start.price/100;
			start.name=start.name.substring(1);
			//System.out.println(start.name);
			String[] newstr=start.name.split(" ");
			for(int i=0; i<newstr.length;i++)
			{
				char rzx5=newstr[i].charAt(0);
				String replace=rzx5+"";
				jieguo[number]=jieguo[number].replace(replace,newstr[i]);
			}		    
			//System.out.println(jieguo[number]);
			//System.out.println("Reliability= "+start.kekao+" Cost= "+start.price+" Q="+q);
			//System.out.println();
			
		    pw.println(jieguo[number]);    
		    pw.println("Reliability= "+start.kekao+" Cost= "+start.price+" Q="+q);
		    pw.println("\n");
			number++;
		}
		
		 long endtime = System.currentTimeMillis();
		 //System.out.println("starttime="+starttime);
		 //System.out.println("endtime="+endtime);
		 long useTime = endtime - starttime;
		 //System.out.println("usetime="+useTime);
		
	      pw.println("starttime="+starttime);
	      //System.out.println();
	      
	      pw.println("endtime="+endtime);
	      //System.out.println();
	      
	      pw.println("usetime="+useTime);
	    
	    pw.close();
		
	}
	
	public static void  choice (List ll)//delete the expensive point that in the list
	{
		Iterator it = ll.iterator();
		float min=(float) require[number][1];
		while(it.hasNext())
			{
			servicedata qwe=(servicedata)it.next();
			if((min<=qwe.price)||(qwe.kekao<require[number][0]))
			{it.remove();}
			else
			{min=qwe.price;}
			}
	}
}


class servicedata implements Comparable//record the point
{
	public String name;
	public float kekao;
	public float price;
	public int compareTo(Object o) 
		{
	        if(!(o instanceof servicedata)) return 1;
	        servicedata tmp=(servicedata)o;
	        if(this.kekao>tmp.kekao)return -1;
	        if(this.kekao<tmp.kekao)return 1;
	        return 0;
		}
}