package firstlogin;

public class Crypter {
	private String key = "25364719552728152624";  //key to encrypt and decrypt 
	
	
	public String enCrypt(String st) { //simple encrypt method
		String hst="";
		for(int i=0;i<st.length(); i++) {
			int val = ( (int)st.charAt(i) + Integer.parseInt(String.valueOf(key.charAt(i))));
			hst = hst+ (char) val;
		}
		return(hst);
	}
	
	public String deCrypt(String st) { //simple decrypt method
		String rehst="";
		for(int i=0;i<st.length(); i++) {
			rehst = rehst + (char) ( (int)st.charAt(i) -  Integer.parseInt(String.valueOf(key.charAt(i))));
		}
		return(rehst);
	}
}