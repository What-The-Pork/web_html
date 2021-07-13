package user;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserDAO userDAO = new UserDAO();
		UserDTO userDTO = new UserDTO();
		userDAO.modifyNixname("SG¿ö³Êºñ", "jusu0228");
		
		userDTO = userDAO.getuser("jusu0228");
		System.out.println(userDTO.getNixname());
	}

}
