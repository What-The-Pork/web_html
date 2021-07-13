package service;
import java.util.ArrayList;
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ServiceDAO svDAO = new ServiceDAO();
		ArrayList<ServiceDTO> list = svDAO.gethitquestion();
		ServiceDTO svDTO =  new ServiceDTO();
		String scid = "1";
		
		for (int i = 0; i < list.size(); i++) {
			String title = null;
			int id = 0;
			svDTO = list.get(i);
			if (i==0 && Integer.parseInt(scid)==svDTO.getScid()) {
				svDTO = list.get(i + 1);
				title = svDTO.getScTitle();
				id = svDTO.getScid();
				System.out.println("1¹ø");
			} 
			else if (i == 7  && Integer.parseInt(scid)==svDTO.getScid()) {
				svDTO = list.get(i - 1);
				title = svDTO.getScTitle();
				id = svDTO.getScid();
				System.out.println("2¹ø");
			} 
			else {
				svDTO = list.get(i - 1);
				title = svDTO.getScTitle();
				id = svDTO.getScid();
				svDTO = list.get(i + 1);
				String nexttitle = svDTO.getScTitle();
				int nextid = svDTO.getScid();
				System.out.println("3¹ø");
			}
		}
	}

}
