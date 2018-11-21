package com.mycompany.wmvnocr;

import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import java.io.File;
public class OCR {
	
    public  static String Procesar(String fname,String leng) throws TesseractException{
        
    	Tesseract tesseract = new Tesseract(); 
        String inputFilePath = fname;
        
      
        tesseract.setDatapath("C:\\Users\\User\\Documents\\NetBeansProjects\\wmvnOCR\\OCR\\");
        tesseract.setLanguage(leng);
        String fulltext = tesseract.doOCR(new File (inputFilePath));
      
        //System.out.println(fulltext);
           
       return fulltext;
       }

    

}
